package decaf.backend;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import decaf.dataflow.BasicBlock;
import decaf.dataflow.FlowGraph;
import decaf.dataflow.BasicBlock.EndKind;
import decaf.machdesc.Asm;
import decaf.machdesc.MachineDescription;
import decaf.tac.Label;
import decaf.tac.Tac;
import decaf.tac.Temp;
import decaf.tac.VTable;
import decaf.utils.MiscUtils;

public class RiscV implements MachineDescription{
	//Register Related
	public static final RiscVRegister[] REGS = new RiscVRegister[] {
		new RiscVRegister(RiscVRegister.RegId.ZERO, "zero"),// Hard-wired zero
		new RiscVRegister(RiscVRegister.RegId.RA, "ra"), // Return address

		new RiscVRegister(RiscVRegister.RegId.SP, "sp"), // Stack pointer
		new RiscVRegister(RiscVRegister.RegId.GP, "gp"), // Global pointer
		new RiscVRegister(RiscVRegister.RegId.TP, "tp"), // Thread pointer

		new RiscVRegister(RiscVRegister.RegId.T0, "t0"), // Temporary / alternate link register

		//Temporaries
		new RiscVRegister(RiscVRegister.RegId.T1, "t1"), // 
		new RiscVRegister(RiscVRegister.RegId.T2, "t2"), 
		
		new RiscVRegister(RiscVRegister.RegId.FP, "s0"), // Saved reg / frame pointer
		new RiscVRegister(RiscVRegister.RegId.S1, "s1"), // Saved reg

		//Function arguments
		new RiscVRegister(RiscVRegister.RegId.A0, "a0"), // return values
		new RiscVRegister(RiscVRegister.RegId.A1, "a1"), 
		new RiscVRegister(RiscVRegister.RegId.A2, "a2"), 
		new RiscVRegister(RiscVRegister.RegId.A3, "a3"), 
		new RiscVRegister(RiscVRegister.RegId.A4, "a4"),
		new RiscVRegister(RiscVRegister.RegId.A5, "a5"),
		new RiscVRegister(RiscVRegister.RegId.A6, "a6"),
		new RiscVRegister(RiscVRegister.RegId.A7, "a7"),

		//Saved registers
		new RiscVRegister(RiscVRegister.RegId.S2, "s2"), 
		new RiscVRegister(RiscVRegister.RegId.S3, "s3"),
		new RiscVRegister(RiscVRegister.RegId.S4, "s4"),
		new RiscVRegister(RiscVRegister.RegId.S5, "s5"),
		new RiscVRegister(RiscVRegister.RegId.S6, "s6"),
		new RiscVRegister(RiscVRegister.RegId.S7, "s7"),
		new RiscVRegister(RiscVRegister.RegId.S8, "s8"),
		new RiscVRegister(RiscVRegister.RegId.S9, "s9"),
		new RiscVRegister(RiscVRegister.RegId.S10, "s10"),
		new RiscVRegister(RiscVRegister.RegId.S11, "s11"),

		//Temporaries
		new RiscVRegister(RiscVRegister.RegId.T3, "t3"),
		new RiscVRegister(RiscVRegister.RegId.T4, "t4"),
		new RiscVRegister(RiscVRegister.RegId.T5, "t5"),
		new RiscVRegister(RiscVRegister.RegId.T6, "t6") 
	};
	//General Register Related
	public static final RiscVRegister[] GENERAL_REGS;
	static{
		GENERAL_REGS = new RiscVRegister[RiscVRegister.RegId.T6.ordinal() - RiscVRegister.RegId.S2.ordinal()];
		System.arraycopy(REGS, RiscVRegister.RegId.S2.ordinal(), GENERAL_REGS, 0, GENERAL_REGS.length);
	}
	private RegisterAllocator regAllocator;

	private RiscVFrameManager frameManager;

	private Map<String, String> stringConst;

	private String getStringConstLabel(String s) {
		String label = stringConst.get(s);
		if (label == null) {
			label = "_STRING" + stringConst.size();
			stringConst.put(s, label);
		}
		return label;
	}

	private PrintWriter output;

	public RiscV(){
		frameManager = new RiscVFrameManager();
		Temp fpTemp = Temp.createTempI4();
		fpTemp.reg = REGS[RiscVRegister.RegId.FP.ordinal()];
		regAllocator = new RegisterAllocator(fpTemp, frameManager, GENERAL_REGS);
		stringConst = new HashMap<String, String>();
	}

	private void emit(String label, String body, String comment) {
		output.println(emitToString(label, body, comment));
		//TODO:  Generate System Call Code
		for (FlowGraph g : gs) {
			regAllocator.reset();
			for (BasicBlock bb : g) {
				bb.label = Label.createLabel();
			}
			for (BasicBlock bb : g) {
				if (bb.cancelled) {
					continue;
				}
				regAllocator.alloc(bb);
				genAsmForBB(bb);
				for (Temp t : bb.saves) {
					bb.appendAsm(new RiscVAsm(RiscVAsm.FORMAT4, "sw", t.reg,
							t.offset, "s0"));  // s0 == fp
				}
			}
			emitProlog(g.getFuncty().label, frameManager.getStackFrameSize());
			emitTrace(g.getBlock(0), g);
			output.println();
		}
		for (int i = 0; i < 3; i++) {
			output.println();
		}
		emitStringConst();
	}

	@Override
	public void setOutputStream(PrintWriter pw) {
		// TODO Auto-generated method stub
		this.output = pw;
	}

	@Override
	public void emitVTable(List<VTable> vtables) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void emitAsm(List<FlowGraph> gs) {
		// TODO Auto-generated method stub
		emit(null, ".section .text", null);


	}

	
}
