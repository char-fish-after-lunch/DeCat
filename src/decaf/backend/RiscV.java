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
	}

	private String emitToString(String label, String body, String comment) {
		if (comment != null && label == null && body == null) {
			return "                                        # " + comment;
		} else {
			StringWriter sw = new StringWriter();
			PrintWriter pw = new PrintWriter(sw);
			if (label != null) {
				if (body == null) {
					pw.format("%-40s", label + ":");
				} else {
					pw.println(label + ":");
				}
			}
			if (body != null) {
				pw.format("          %-30s", body);
			}
			if (comment != null) {
				pw.print("# " + comment);
			}
			pw.close();
			return sw.toString();
		}
	}

	
	private void emitStringConst() {
		emit(null, ".section .rodata", null);
		for (Entry<String, String> e : stringConst.entrySet()) {
			emit(e.getValue(), ".string " + MiscUtils.quote(e.getKey()), null);
		}
	}

	private void genAsmForBB(BasicBlock bb) {
		for(Tac tac = bb.tacList; tac != null; tac = tac.next){
			switch (tac.opc) {
				case ADD:
					bb.appendAsm(new RiscVAsm(RiscVAsm.FORMAT3, "add", tac.op0.reg, tac.op1.reg, tac.op2.reg));
					break;
				
				case SUB:
					bb.appendAsm(new RiscVAsm(RiscVAsm.FORMAT3, "sub", tac.op0.reg, tac.op1.reg, tac.op2.reg));
					break;
				
				case MUL: //TODO Does not support mul, need to change to call
					bb.appendAsm(new RiscVAsm(RiscVAsm.FORMAT3, "mul", tac.op0.reg, tac.op1.reg, tac.op2.reg));
					break;
				
				case DIV: //TODO Does not support div, need to change to call
					bb.appendAsm(new RiscVAsm(RiscVAsm.FORMAT3, "div", tac.op0.reg, tac.op1.reg, tac.op2.reg));
					break;
				
				case MOD: //TODO Does not support rem, need to change to call
					bb.appendAsm(new RiscVAsm(RiscVAsm.FORMAT3, "rem", tac.op0.reg, tac.op1.reg, tac.op2.reg));
					break;
				
				case LAND:
					bb.appendAsm(new RiscVAsm(RiscVAsm.FORMAT3, "and", tac.op0.reg,tac.op1.reg, tac.op2.reg));
					break;
				
				case LOR:
					bb.appendAsm(new RiscVAsm(RiscVAsm.FORMAT3, "or", tac.op0.reg, tac.op1.reg, tac.op2.reg));
					break;
				
				case GTR: // Use slt and Swap Reg 1 and Reg 2
					bb.appendAsm(new RiscVAsm(RiscVAsm.FORMAT3, "slt", tac.op0.reg, tac.op2.reg, tac.op1.reg));
					break;
				
				case GEQ:
					bb.appendAsm(new RiscVAsm(RiscVAsm.FORMAT3, "slt", tac.op0.reg, tac.op1.reg, tac.op2.reg));
					bb.appendAsm(new RiscVAsm(RiscVAsm.FORMAT3, "xori", tac.op0.reg, tac.op0.reg, 1));
					break;

				case EQU:
					bb.appendAsm(new RiscVAsm(RiscVAsm.FORMAT3, "sub", tac.op0.reg, tac.op1.reg, tac.op2.reg));
					bb.appendAsm(new RiscVAsm(RiscVAsm.FORMAT2, "seqz", tac.op0.reg, tac.op0.reg));
					break;

				case NEQ:
					bb.appendAsm(new RiscVAsm(RiscVAsm.FORMAT3, "sub", tac.op0.reg, tac.op1.reg, tac.op2.reg));
					bb.appendAsm(new RiscVAsm(RiscVAsm.FORMAT3, "snez", tac.op0.reg, tac.op0.reg));
					break;

				case LEQ:
					bb.appendAsm(new RiscVAsm(RiscVAsm.FORMAT3, "slt", tac.op0.reg, tac.op2.reg, tac.op1.reg));
					bb.appendAsm(new RiscVAsm(RiscVAsm.FORMAT3, "xori", tac.op0.reg, tac.op0.reg, 1));
					break;

				case LES:
					bb.appendAsm(new RiscVAsm(RiscVAsm.FORMAT3, "slt", tac.op0.reg, tac.op1.reg, tac.op2.reg));
					break;

				case NEG:
					bb.appendAsm(new RiscVAsm(RiscVAsm.FORMAT3, "neg", tac.op0.reg, tac.op1.reg, tac.op2.reg));
					break;
				
				case LNOT:
					bb.appendAsm(new RiscVAsm(RiscVAsm.FORMAT3, "not", tac.op0.reg, tac.op1.reg, tac.op2.reg));
					break;

				case ASSIGN:
					if (tac.op0.reg != tac.op1.reg){
						bb.appendAsm(new RiscVAsm(RiscVAsm.FORMAT2, "mv", tac.op0.reg, tac.op1.reg));
					}
					break;

				case LOAD_VTBL:
					bb.appendAsm(new RiscVAsm(RiscVAsm.FORMAT2, "la", tac.op0.reg, tac.vt.name));
					break;

				case LOAD_IMM4:
					if (!tac.op1.isConst){
						throw new IllegalArgumentException();
					}
					bb.appendAsm(new RiscVAsm(RiscVAsm.FORMAT2, "li", tac.op0.reg, tac.op1.value));
					break;

				case LOAD_STR_CONST:
					String label = getStringConstLabel(tac.str);
					bb.appendAsm(new RiscVAsm(RiscVAsm.FORMAT2, "la", tac.op0.reg, label));
					break;

				case INDIRECT_CALL:
				case DIRECT_CALL:
					genAsmForCall(bb, tac);
					break;

				case PARM:
					bb.appendAsm(new RiscVAsm(RiscVAsm.FORMAT4, "sw", tac.op0.reg, tac.op1.value, "sp"));
					break;

				case LOAD:
					bb.appendAsm(new RiscVAsm(RiscVAsm.FORMAT4, "lw", tac.op0.reg, tac.op2.value, tac.op1.value));
					break;

				case STORE:
					bb.appendAsm(new RiscVAsm(RiscVAsm.FORMAT4, "sw", tac.op0.reg, tac.op2.value, tac.op1.value));
					break;

				case BRANCH:
				case BEQZ:
				case BNEZ:
				case RETURN:
					throw new IllegalArgumentException();
		}		
	
		}
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
	
	private void emitProlog(Label entryLabel, int frameSize) {
		emit(entryLabel.name, null, "function entry");
		emit(null, "sw s0, 0(sp)", null);
		emit(null, "sw ra, -4(sp)", null);
		emit(null, "move s0, sp", null);
		emit(null, "addi sp, sp, "
				+ (-frameSize - 2 * OffsetCounter.POINTER_SIZE), null);
	}
	
	@Override
	public void emitAsm(List<FlowGraph> gs) {
		// TODO Auto-generated method stub
		emit(null, ".section .text", null);
		
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
		
		for (int i = 0; i < 3; i++) {output.println();}
		emitStringConst();
	}
	
	private void genAsmForCall(BasicBlock bb, Tac call) {
		for (Temp t : call.saves){
			bb.appendAsm(new RiscVAsm(RiscVAsm.FORMAT4, "sw", t.reg, t.offset, "s0"));
		}
		if (call.opc == Tac.Kind.DIRECT_CALL){
			bb.appendAsm(new RiscVAsm(RiscVAsm.FORMAT1, "call", call.label));
		} else {
			bb.appendAsm(new RiscVAsm(RiscVAsm.FORMAT1, "tail", call.label));
		}
		if (call.op0 != null){
			bb.appendAsm(new RiscVAsm(RiscVAsm.FORMAT2, "move", call.op0.reg, "a0"));
		}
		for (Temp t : call.saves){
			bb.appendAsm(new RiscVAsm(RiscVAsm.FORMAT4, "lw", t.reg, t.offset, "s0"));
		}
	}
	
	private void emitTrace(BasicBlock bb, FlowGraph graph) {
		
	}
	
}
