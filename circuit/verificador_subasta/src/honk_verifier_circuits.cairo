use core::circuit::{
    u384, circuit_add, circuit_sub, circuit_mul, circuit_inverse, EvalCircuitTrait,
    CircuitOutputsTrait, CircuitInputs,
};
use garaga::core::circuit::AddInputResultTrait2;
use garaga::ec_ops::FunctionFelt;
use core::circuit::CircuitElement as CE;
use core::circuit::CircuitInput as CI;
use garaga::definitions::{G1Point, get_GRUMPKIN_modulus, get_BN254_modulus};
use core::option::Option;

#[inline(always)]
pub fn run_GRUMPKIN_HONK_SUMCHECK_SIZE_10_PUB_1_circuit(
    p_public_inputs: Span<u256>,
    p_public_inputs_offset: u384,
    sumcheck_univariates_flat: Span<u256>,
    sumcheck_evaluations: Span<u256>,
    tp_sum_check_u_challenges: Span<u128>,
    tp_gate_challenges: Span<u128>,
    tp_eta_1: u384,
    tp_eta_2: u384,
    tp_eta_3: u384,
    tp_beta: u384,
    tp_gamma: u384,
    tp_base_rlc: u384,
    tp_alphas: Span<u128>,
) -> (u384, u384) {
    // CONSTANT stack
    let in0 = CE::<CI<0>> {}; // 0x1
    let in1 = CE::<CI<1>> {}; // 0x400
    let in2 = CE::<CI<2>> {}; // 0x0
    let in3 = CE::<CI<3>> {}; // 0x30644e72e131a029b85045b68181585d2833e84879b9709143e1f593efffec51
    let in4 = CE::<CI<4>> {}; // 0x2d0
    let in5 = CE::<CI<5>> {}; // 0x30644e72e131a029b85045b68181585d2833e84879b9709143e1f593efffff11
    let in6 = CE::<CI<6>> {}; // 0x90
    let in7 = CE::<CI<7>> {}; // 0x30644e72e131a029b85045b68181585d2833e84879b9709143e1f593efffff71
    let in8 = CE::<CI<8>> {}; // 0xf0
    let in9 = CE::<CI<9>> {}; // 0x30644e72e131a029b85045b68181585d2833e84879b9709143e1f593effffd31
    let in10 = CE::<CI<10>> {}; // 0x13b0
    let in11 = CE::<CI<11>> {}; // 0x2
    let in12 = CE::<CI<12>> {}; // 0x3
    let in13 = CE::<CI<13>> {}; // 0x4
    let in14 = CE::<CI<14>> {}; // 0x5
    let in15 = CE::<CI<15>> {}; // 0x6
    let in16 = CE::<CI<16>> {}; // 0x7
    let in17 = CE::<
        CI<17>,
    > {}; // 0x183227397098d014dc2822db40c0ac2e9419f4243cdcb848a1f0fac9f8000000
    let in18 = CE::<CI<18>> {}; // -0x1 % p
    let in19 = CE::<CI<19>> {}; // -0x2 % p
    let in20 = CE::<CI<20>> {}; // -0x3 % p
    let in21 = CE::<CI<21>> {}; // 0x11
    let in22 = CE::<CI<22>> {}; // 0x9
    let in23 = CE::<CI<23>> {}; // 0x100000000000000000
    let in24 = CE::<CI<24>> {}; // 0x4000
    let in25 = CE::<
        CI<25>,
    > {}; // 0x10dc6e9c006ea38b04b1e03b4bd9490c0d03f98929ca1d7fb56821fd19d3b6e7
    let in26 = CE::<CI<26>> {}; // 0xc28145b6a44df3e0149b3d0a30b3bb599df9756d4dd9b84a86b38cfb45a740b
    let in27 = CE::<CI<27>> {}; // 0x544b8338791518b2c7645a50392798b21f75bb60e3596170067d00141cac15
    let in28 = CE::<
        CI<28>,
    > {}; // 0x222c01175718386f2e2e82eb122789e352e105a3b8fa852613bc534433ee428b

    // INPUT stack
    let (in29, in30, in31) = (CE::<CI<29>> {}, CE::<CI<30>> {}, CE::<CI<31>> {});
    let (in32, in33, in34) = (CE::<CI<32>> {}, CE::<CI<33>> {}, CE::<CI<34>> {});
    let (in35, in36, in37) = (CE::<CI<35>> {}, CE::<CI<36>> {}, CE::<CI<37>> {});
    let (in38, in39, in40) = (CE::<CI<38>> {}, CE::<CI<39>> {}, CE::<CI<40>> {});
    let (in41, in42, in43) = (CE::<CI<41>> {}, CE::<CI<42>> {}, CE::<CI<43>> {});
    let (in44, in45, in46) = (CE::<CI<44>> {}, CE::<CI<45>> {}, CE::<CI<46>> {});
    let (in47, in48, in49) = (CE::<CI<47>> {}, CE::<CI<48>> {}, CE::<CI<49>> {});
    let (in50, in51, in52) = (CE::<CI<50>> {}, CE::<CI<51>> {}, CE::<CI<52>> {});
    let (in53, in54, in55) = (CE::<CI<53>> {}, CE::<CI<54>> {}, CE::<CI<55>> {});
    let (in56, in57, in58) = (CE::<CI<56>> {}, CE::<CI<57>> {}, CE::<CI<58>> {});
    let (in59, in60, in61) = (CE::<CI<59>> {}, CE::<CI<60>> {}, CE::<CI<61>> {});
    let (in62, in63, in64) = (CE::<CI<62>> {}, CE::<CI<63>> {}, CE::<CI<64>> {});
    let (in65, in66, in67) = (CE::<CI<65>> {}, CE::<CI<66>> {}, CE::<CI<67>> {});
    let (in68, in69, in70) = (CE::<CI<68>> {}, CE::<CI<69>> {}, CE::<CI<70>> {});
    let (in71, in72, in73) = (CE::<CI<71>> {}, CE::<CI<72>> {}, CE::<CI<73>> {});
    let (in74, in75, in76) = (CE::<CI<74>> {}, CE::<CI<75>> {}, CE::<CI<76>> {});
    let (in77, in78, in79) = (CE::<CI<77>> {}, CE::<CI<78>> {}, CE::<CI<79>> {});
    let (in80, in81, in82) = (CE::<CI<80>> {}, CE::<CI<81>> {}, CE::<CI<82>> {});
    let (in83, in84, in85) = (CE::<CI<83>> {}, CE::<CI<84>> {}, CE::<CI<85>> {});
    let (in86, in87, in88) = (CE::<CI<86>> {}, CE::<CI<87>> {}, CE::<CI<88>> {});
    let (in89, in90, in91) = (CE::<CI<89>> {}, CE::<CI<90>> {}, CE::<CI<91>> {});
    let (in92, in93, in94) = (CE::<CI<92>> {}, CE::<CI<93>> {}, CE::<CI<94>> {});
    let (in95, in96, in97) = (CE::<CI<95>> {}, CE::<CI<96>> {}, CE::<CI<97>> {});
    let (in98, in99, in100) = (CE::<CI<98>> {}, CE::<CI<99>> {}, CE::<CI<100>> {});
    let (in101, in102, in103) = (CE::<CI<101>> {}, CE::<CI<102>> {}, CE::<CI<103>> {});
    let (in104, in105, in106) = (CE::<CI<104>> {}, CE::<CI<105>> {}, CE::<CI<106>> {});
    let (in107, in108, in109) = (CE::<CI<107>> {}, CE::<CI<108>> {}, CE::<CI<109>> {});
    let (in110, in111, in112) = (CE::<CI<110>> {}, CE::<CI<111>> {}, CE::<CI<112>> {});
    let (in113, in114, in115) = (CE::<CI<113>> {}, CE::<CI<114>> {}, CE::<CI<115>> {});
    let (in116, in117, in118) = (CE::<CI<116>> {}, CE::<CI<117>> {}, CE::<CI<118>> {});
    let (in119, in120, in121) = (CE::<CI<119>> {}, CE::<CI<120>> {}, CE::<CI<121>> {});
    let (in122, in123, in124) = (CE::<CI<122>> {}, CE::<CI<123>> {}, CE::<CI<124>> {});
    let (in125, in126, in127) = (CE::<CI<125>> {}, CE::<CI<126>> {}, CE::<CI<127>> {});
    let (in128, in129, in130) = (CE::<CI<128>> {}, CE::<CI<129>> {}, CE::<CI<130>> {});
    let (in131, in132, in133) = (CE::<CI<131>> {}, CE::<CI<132>> {}, CE::<CI<133>> {});
    let (in134, in135, in136) = (CE::<CI<134>> {}, CE::<CI<135>> {}, CE::<CI<136>> {});
    let (in137, in138, in139) = (CE::<CI<137>> {}, CE::<CI<138>> {}, CE::<CI<139>> {});
    let (in140, in141, in142) = (CE::<CI<140>> {}, CE::<CI<141>> {}, CE::<CI<142>> {});
    let (in143, in144, in145) = (CE::<CI<143>> {}, CE::<CI<144>> {}, CE::<CI<145>> {});
    let (in146, in147, in148) = (CE::<CI<146>> {}, CE::<CI<147>> {}, CE::<CI<148>> {});
    let (in149, in150, in151) = (CE::<CI<149>> {}, CE::<CI<150>> {}, CE::<CI<151>> {});
    let (in152, in153, in154) = (CE::<CI<152>> {}, CE::<CI<153>> {}, CE::<CI<154>> {});
    let (in155, in156, in157) = (CE::<CI<155>> {}, CE::<CI<156>> {}, CE::<CI<157>> {});
    let (in158, in159, in160) = (CE::<CI<158>> {}, CE::<CI<159>> {}, CE::<CI<160>> {});
    let (in161, in162, in163) = (CE::<CI<161>> {}, CE::<CI<162>> {}, CE::<CI<163>> {});
    let (in164, in165, in166) = (CE::<CI<164>> {}, CE::<CI<165>> {}, CE::<CI<166>> {});
    let (in167, in168, in169) = (CE::<CI<167>> {}, CE::<CI<168>> {}, CE::<CI<169>> {});
    let (in170, in171, in172) = (CE::<CI<170>> {}, CE::<CI<171>> {}, CE::<CI<172>> {});
    let (in173, in174, in175) = (CE::<CI<173>> {}, CE::<CI<174>> {}, CE::<CI<175>> {});
    let (in176, in177, in178) = (CE::<CI<176>> {}, CE::<CI<177>> {}, CE::<CI<178>> {});
    let (in179, in180, in181) = (CE::<CI<179>> {}, CE::<CI<180>> {}, CE::<CI<181>> {});
    let (in182, in183, in184) = (CE::<CI<182>> {}, CE::<CI<183>> {}, CE::<CI<184>> {});
    let (in185, in186, in187) = (CE::<CI<185>> {}, CE::<CI<186>> {}, CE::<CI<187>> {});
    let (in188, in189, in190) = (CE::<CI<188>> {}, CE::<CI<189>> {}, CE::<CI<190>> {});
    let (in191, in192, in193) = (CE::<CI<191>> {}, CE::<CI<192>> {}, CE::<CI<193>> {});
    let (in194, in195, in196) = (CE::<CI<194>> {}, CE::<CI<195>> {}, CE::<CI<196>> {});
    let (in197, in198, in199) = (CE::<CI<197>> {}, CE::<CI<198>> {}, CE::<CI<199>> {});
    let (in200, in201) = (CE::<CI<200>> {}, CE::<CI<201>> {});
    let t0 = circuit_add(in1, in30);
    let t1 = circuit_mul(in174, t0);
    let t2 = circuit_add(in175, t1);
    let t3 = circuit_add(in30, in0);
    let t4 = circuit_mul(in174, t3);
    let t5 = circuit_sub(in175, t4);
    let t6 = circuit_add(t2, in29);
    let t7 = circuit_mul(in0, t6);
    let t8 = circuit_add(t5, in29);
    let t9 = circuit_mul(in0, t8);
    let t10 = circuit_inverse(t9);
    let t11 = circuit_mul(t7, t10);
    let t12 = circuit_add(in31, in32);
    let t13 = circuit_sub(t12, in2);
    let t14 = circuit_mul(t13, in176);
    let t15 = circuit_add(in2, t14);
    let t16 = circuit_mul(in176, in176);
    let t17 = circuit_sub(in151, in2);
    let t18 = circuit_mul(in0, t17);
    let t19 = circuit_sub(in151, in2);
    let t20 = circuit_mul(in3, t19);
    let t21 = circuit_inverse(t20);
    let t22 = circuit_mul(in31, t21);
    let t23 = circuit_add(in2, t22);
    let t24 = circuit_sub(in151, in0);
    let t25 = circuit_mul(t18, t24);
    let t26 = circuit_sub(in151, in0);
    let t27 = circuit_mul(in4, t26);
    let t28 = circuit_inverse(t27);
    let t29 = circuit_mul(in32, t28);
    let t30 = circuit_add(t23, t29);
    let t31 = circuit_sub(in151, in11);
    let t32 = circuit_mul(t25, t31);
    let t33 = circuit_sub(in151, in11);
    let t34 = circuit_mul(in5, t33);
    let t35 = circuit_inverse(t34);
    let t36 = circuit_mul(in33, t35);
    let t37 = circuit_add(t30, t36);
    let t38 = circuit_sub(in151, in12);
    let t39 = circuit_mul(t32, t38);
    let t40 = circuit_sub(in151, in12);
    let t41 = circuit_mul(in6, t40);
    let t42 = circuit_inverse(t41);
    let t43 = circuit_mul(in34, t42);
    let t44 = circuit_add(t37, t43);
    let t45 = circuit_sub(in151, in13);
    let t46 = circuit_mul(t39, t45);
    let t47 = circuit_sub(in151, in13);
    let t48 = circuit_mul(in7, t47);
    let t49 = circuit_inverse(t48);
    let t50 = circuit_mul(in35, t49);
    let t51 = circuit_add(t44, t50);
    let t52 = circuit_sub(in151, in14);
    let t53 = circuit_mul(t46, t52);
    let t54 = circuit_sub(in151, in14);
    let t55 = circuit_mul(in8, t54);
    let t56 = circuit_inverse(t55);
    let t57 = circuit_mul(in36, t56);
    let t58 = circuit_add(t51, t57);
    let t59 = circuit_sub(in151, in15);
    let t60 = circuit_mul(t53, t59);
    let t61 = circuit_sub(in151, in15);
    let t62 = circuit_mul(in9, t61);
    let t63 = circuit_inverse(t62);
    let t64 = circuit_mul(in37, t63);
    let t65 = circuit_add(t58, t64);
    let t66 = circuit_sub(in151, in16);
    let t67 = circuit_mul(t60, t66);
    let t68 = circuit_sub(in151, in16);
    let t69 = circuit_mul(in10, t68);
    let t70 = circuit_inverse(t69);
    let t71 = circuit_mul(in38, t70);
    let t72 = circuit_add(t65, t71);
    let t73 = circuit_mul(t72, t67);
    let t74 = circuit_sub(in161, in0);
    let t75 = circuit_mul(in151, t74);
    let t76 = circuit_add(in0, t75);
    let t77 = circuit_mul(in0, t76);
    let t78 = circuit_add(in39, in40);
    let t79 = circuit_sub(t78, t73);
    let t80 = circuit_mul(t79, t16);
    let t81 = circuit_add(t15, t80);
    let t82 = circuit_mul(t16, in176);
    let t83 = circuit_sub(in152, in2);
    let t84 = circuit_mul(in0, t83);
    let t85 = circuit_sub(in152, in2);
    let t86 = circuit_mul(in3, t85);
    let t87 = circuit_inverse(t86);
    let t88 = circuit_mul(in39, t87);
    let t89 = circuit_add(in2, t88);
    let t90 = circuit_sub(in152, in0);
    let t91 = circuit_mul(t84, t90);
    let t92 = circuit_sub(in152, in0);
    let t93 = circuit_mul(in4, t92);
    let t94 = circuit_inverse(t93);
    let t95 = circuit_mul(in40, t94);
    let t96 = circuit_add(t89, t95);
    let t97 = circuit_sub(in152, in11);
    let t98 = circuit_mul(t91, t97);
    let t99 = circuit_sub(in152, in11);
    let t100 = circuit_mul(in5, t99);
    let t101 = circuit_inverse(t100);
    let t102 = circuit_mul(in41, t101);
    let t103 = circuit_add(t96, t102);
    let t104 = circuit_sub(in152, in12);
    let t105 = circuit_mul(t98, t104);
    let t106 = circuit_sub(in152, in12);
    let t107 = circuit_mul(in6, t106);
    let t108 = circuit_inverse(t107);
    let t109 = circuit_mul(in42, t108);
    let t110 = circuit_add(t103, t109);
    let t111 = circuit_sub(in152, in13);
    let t112 = circuit_mul(t105, t111);
    let t113 = circuit_sub(in152, in13);
    let t114 = circuit_mul(in7, t113);
    let t115 = circuit_inverse(t114);
    let t116 = circuit_mul(in43, t115);
    let t117 = circuit_add(t110, t116);
    let t118 = circuit_sub(in152, in14);
    let t119 = circuit_mul(t112, t118);
    let t120 = circuit_sub(in152, in14);
    let t121 = circuit_mul(in8, t120);
    let t122 = circuit_inverse(t121);
    let t123 = circuit_mul(in44, t122);
    let t124 = circuit_add(t117, t123);
    let t125 = circuit_sub(in152, in15);
    let t126 = circuit_mul(t119, t125);
    let t127 = circuit_sub(in152, in15);
    let t128 = circuit_mul(in9, t127);
    let t129 = circuit_inverse(t128);
    let t130 = circuit_mul(in45, t129);
    let t131 = circuit_add(t124, t130);
    let t132 = circuit_sub(in152, in16);
    let t133 = circuit_mul(t126, t132);
    let t134 = circuit_sub(in152, in16);
    let t135 = circuit_mul(in10, t134);
    let t136 = circuit_inverse(t135);
    let t137 = circuit_mul(in46, t136);
    let t138 = circuit_add(t131, t137);
    let t139 = circuit_mul(t138, t133);
    let t140 = circuit_sub(in162, in0);
    let t141 = circuit_mul(in152, t140);
    let t142 = circuit_add(in0, t141);
    let t143 = circuit_mul(t77, t142);
    let t144 = circuit_add(in47, in48);
    let t145 = circuit_sub(t144, t139);
    let t146 = circuit_mul(t145, t82);
    let t147 = circuit_add(t81, t146);
    let t148 = circuit_mul(t82, in176);
    let t149 = circuit_sub(in153, in2);
    let t150 = circuit_mul(in0, t149);
    let t151 = circuit_sub(in153, in2);
    let t152 = circuit_mul(in3, t151);
    let t153 = circuit_inverse(t152);
    let t154 = circuit_mul(in47, t153);
    let t155 = circuit_add(in2, t154);
    let t156 = circuit_sub(in153, in0);
    let t157 = circuit_mul(t150, t156);
    let t158 = circuit_sub(in153, in0);
    let t159 = circuit_mul(in4, t158);
    let t160 = circuit_inverse(t159);
    let t161 = circuit_mul(in48, t160);
    let t162 = circuit_add(t155, t161);
    let t163 = circuit_sub(in153, in11);
    let t164 = circuit_mul(t157, t163);
    let t165 = circuit_sub(in153, in11);
    let t166 = circuit_mul(in5, t165);
    let t167 = circuit_inverse(t166);
    let t168 = circuit_mul(in49, t167);
    let t169 = circuit_add(t162, t168);
    let t170 = circuit_sub(in153, in12);
    let t171 = circuit_mul(t164, t170);
    let t172 = circuit_sub(in153, in12);
    let t173 = circuit_mul(in6, t172);
    let t174 = circuit_inverse(t173);
    let t175 = circuit_mul(in50, t174);
    let t176 = circuit_add(t169, t175);
    let t177 = circuit_sub(in153, in13);
    let t178 = circuit_mul(t171, t177);
    let t179 = circuit_sub(in153, in13);
    let t180 = circuit_mul(in7, t179);
    let t181 = circuit_inverse(t180);
    let t182 = circuit_mul(in51, t181);
    let t183 = circuit_add(t176, t182);
    let t184 = circuit_sub(in153, in14);
    let t185 = circuit_mul(t178, t184);
    let t186 = circuit_sub(in153, in14);
    let t187 = circuit_mul(in8, t186);
    let t188 = circuit_inverse(t187);
    let t189 = circuit_mul(in52, t188);
    let t190 = circuit_add(t183, t189);
    let t191 = circuit_sub(in153, in15);
    let t192 = circuit_mul(t185, t191);
    let t193 = circuit_sub(in153, in15);
    let t194 = circuit_mul(in9, t193);
    let t195 = circuit_inverse(t194);
    let t196 = circuit_mul(in53, t195);
    let t197 = circuit_add(t190, t196);
    let t198 = circuit_sub(in153, in16);
    let t199 = circuit_mul(t192, t198);
    let t200 = circuit_sub(in153, in16);
    let t201 = circuit_mul(in10, t200);
    let t202 = circuit_inverse(t201);
    let t203 = circuit_mul(in54, t202);
    let t204 = circuit_add(t197, t203);
    let t205 = circuit_mul(t204, t199);
    let t206 = circuit_sub(in163, in0);
    let t207 = circuit_mul(in153, t206);
    let t208 = circuit_add(in0, t207);
    let t209 = circuit_mul(t143, t208);
    let t210 = circuit_add(in55, in56);
    let t211 = circuit_sub(t210, t205);
    let t212 = circuit_mul(t211, t148);
    let t213 = circuit_add(t147, t212);
    let t214 = circuit_mul(t148, in176);
    let t215 = circuit_sub(in154, in2);
    let t216 = circuit_mul(in0, t215);
    let t217 = circuit_sub(in154, in2);
    let t218 = circuit_mul(in3, t217);
    let t219 = circuit_inverse(t218);
    let t220 = circuit_mul(in55, t219);
    let t221 = circuit_add(in2, t220);
    let t222 = circuit_sub(in154, in0);
    let t223 = circuit_mul(t216, t222);
    let t224 = circuit_sub(in154, in0);
    let t225 = circuit_mul(in4, t224);
    let t226 = circuit_inverse(t225);
    let t227 = circuit_mul(in56, t226);
    let t228 = circuit_add(t221, t227);
    let t229 = circuit_sub(in154, in11);
    let t230 = circuit_mul(t223, t229);
    let t231 = circuit_sub(in154, in11);
    let t232 = circuit_mul(in5, t231);
    let t233 = circuit_inverse(t232);
    let t234 = circuit_mul(in57, t233);
    let t235 = circuit_add(t228, t234);
    let t236 = circuit_sub(in154, in12);
    let t237 = circuit_mul(t230, t236);
    let t238 = circuit_sub(in154, in12);
    let t239 = circuit_mul(in6, t238);
    let t240 = circuit_inverse(t239);
    let t241 = circuit_mul(in58, t240);
    let t242 = circuit_add(t235, t241);
    let t243 = circuit_sub(in154, in13);
    let t244 = circuit_mul(t237, t243);
    let t245 = circuit_sub(in154, in13);
    let t246 = circuit_mul(in7, t245);
    let t247 = circuit_inverse(t246);
    let t248 = circuit_mul(in59, t247);
    let t249 = circuit_add(t242, t248);
    let t250 = circuit_sub(in154, in14);
    let t251 = circuit_mul(t244, t250);
    let t252 = circuit_sub(in154, in14);
    let t253 = circuit_mul(in8, t252);
    let t254 = circuit_inverse(t253);
    let t255 = circuit_mul(in60, t254);
    let t256 = circuit_add(t249, t255);
    let t257 = circuit_sub(in154, in15);
    let t258 = circuit_mul(t251, t257);
    let t259 = circuit_sub(in154, in15);
    let t260 = circuit_mul(in9, t259);
    let t261 = circuit_inverse(t260);
    let t262 = circuit_mul(in61, t261);
    let t263 = circuit_add(t256, t262);
    let t264 = circuit_sub(in154, in16);
    let t265 = circuit_mul(t258, t264);
    let t266 = circuit_sub(in154, in16);
    let t267 = circuit_mul(in10, t266);
    let t268 = circuit_inverse(t267);
    let t269 = circuit_mul(in62, t268);
    let t270 = circuit_add(t263, t269);
    let t271 = circuit_mul(t270, t265);
    let t272 = circuit_sub(in164, in0);
    let t273 = circuit_mul(in154, t272);
    let t274 = circuit_add(in0, t273);
    let t275 = circuit_mul(t209, t274);
    let t276 = circuit_add(in63, in64);
    let t277 = circuit_sub(t276, t271);
    let t278 = circuit_mul(t277, t214);
    let t279 = circuit_add(t213, t278);
    let t280 = circuit_mul(t214, in176);
    let t281 = circuit_sub(in155, in2);
    let t282 = circuit_mul(in0, t281);
    let t283 = circuit_sub(in155, in2);
    let t284 = circuit_mul(in3, t283);
    let t285 = circuit_inverse(t284);
    let t286 = circuit_mul(in63, t285);
    let t287 = circuit_add(in2, t286);
    let t288 = circuit_sub(in155, in0);
    let t289 = circuit_mul(t282, t288);
    let t290 = circuit_sub(in155, in0);
    let t291 = circuit_mul(in4, t290);
    let t292 = circuit_inverse(t291);
    let t293 = circuit_mul(in64, t292);
    let t294 = circuit_add(t287, t293);
    let t295 = circuit_sub(in155, in11);
    let t296 = circuit_mul(t289, t295);
    let t297 = circuit_sub(in155, in11);
    let t298 = circuit_mul(in5, t297);
    let t299 = circuit_inverse(t298);
    let t300 = circuit_mul(in65, t299);
    let t301 = circuit_add(t294, t300);
    let t302 = circuit_sub(in155, in12);
    let t303 = circuit_mul(t296, t302);
    let t304 = circuit_sub(in155, in12);
    let t305 = circuit_mul(in6, t304);
    let t306 = circuit_inverse(t305);
    let t307 = circuit_mul(in66, t306);
    let t308 = circuit_add(t301, t307);
    let t309 = circuit_sub(in155, in13);
    let t310 = circuit_mul(t303, t309);
    let t311 = circuit_sub(in155, in13);
    let t312 = circuit_mul(in7, t311);
    let t313 = circuit_inverse(t312);
    let t314 = circuit_mul(in67, t313);
    let t315 = circuit_add(t308, t314);
    let t316 = circuit_sub(in155, in14);
    let t317 = circuit_mul(t310, t316);
    let t318 = circuit_sub(in155, in14);
    let t319 = circuit_mul(in8, t318);
    let t320 = circuit_inverse(t319);
    let t321 = circuit_mul(in68, t320);
    let t322 = circuit_add(t315, t321);
    let t323 = circuit_sub(in155, in15);
    let t324 = circuit_mul(t317, t323);
    let t325 = circuit_sub(in155, in15);
    let t326 = circuit_mul(in9, t325);
    let t327 = circuit_inverse(t326);
    let t328 = circuit_mul(in69, t327);
    let t329 = circuit_add(t322, t328);
    let t330 = circuit_sub(in155, in16);
    let t331 = circuit_mul(t324, t330);
    let t332 = circuit_sub(in155, in16);
    let t333 = circuit_mul(in10, t332);
    let t334 = circuit_inverse(t333);
    let t335 = circuit_mul(in70, t334);
    let t336 = circuit_add(t329, t335);
    let t337 = circuit_mul(t336, t331);
    let t338 = circuit_sub(in165, in0);
    let t339 = circuit_mul(in155, t338);
    let t340 = circuit_add(in0, t339);
    let t341 = circuit_mul(t275, t340);
    let t342 = circuit_add(in71, in72);
    let t343 = circuit_sub(t342, t337);
    let t344 = circuit_mul(t343, t280);
    let t345 = circuit_add(t279, t344);
    let t346 = circuit_mul(t280, in176);
    let t347 = circuit_sub(in156, in2);
    let t348 = circuit_mul(in0, t347);
    let t349 = circuit_sub(in156, in2);
    let t350 = circuit_mul(in3, t349);
    let t351 = circuit_inverse(t350);
    let t352 = circuit_mul(in71, t351);
    let t353 = circuit_add(in2, t352);
    let t354 = circuit_sub(in156, in0);
    let t355 = circuit_mul(t348, t354);
    let t356 = circuit_sub(in156, in0);
    let t357 = circuit_mul(in4, t356);
    let t358 = circuit_inverse(t357);
    let t359 = circuit_mul(in72, t358);
    let t360 = circuit_add(t353, t359);
    let t361 = circuit_sub(in156, in11);
    let t362 = circuit_mul(t355, t361);
    let t363 = circuit_sub(in156, in11);
    let t364 = circuit_mul(in5, t363);
    let t365 = circuit_inverse(t364);
    let t366 = circuit_mul(in73, t365);
    let t367 = circuit_add(t360, t366);
    let t368 = circuit_sub(in156, in12);
    let t369 = circuit_mul(t362, t368);
    let t370 = circuit_sub(in156, in12);
    let t371 = circuit_mul(in6, t370);
    let t372 = circuit_inverse(t371);
    let t373 = circuit_mul(in74, t372);
    let t374 = circuit_add(t367, t373);
    let t375 = circuit_sub(in156, in13);
    let t376 = circuit_mul(t369, t375);
    let t377 = circuit_sub(in156, in13);
    let t378 = circuit_mul(in7, t377);
    let t379 = circuit_inverse(t378);
    let t380 = circuit_mul(in75, t379);
    let t381 = circuit_add(t374, t380);
    let t382 = circuit_sub(in156, in14);
    let t383 = circuit_mul(t376, t382);
    let t384 = circuit_sub(in156, in14);
    let t385 = circuit_mul(in8, t384);
    let t386 = circuit_inverse(t385);
    let t387 = circuit_mul(in76, t386);
    let t388 = circuit_add(t381, t387);
    let t389 = circuit_sub(in156, in15);
    let t390 = circuit_mul(t383, t389);
    let t391 = circuit_sub(in156, in15);
    let t392 = circuit_mul(in9, t391);
    let t393 = circuit_inverse(t392);
    let t394 = circuit_mul(in77, t393);
    let t395 = circuit_add(t388, t394);
    let t396 = circuit_sub(in156, in16);
    let t397 = circuit_mul(t390, t396);
    let t398 = circuit_sub(in156, in16);
    let t399 = circuit_mul(in10, t398);
    let t400 = circuit_inverse(t399);
    let t401 = circuit_mul(in78, t400);
    let t402 = circuit_add(t395, t401);
    let t403 = circuit_mul(t402, t397);
    let t404 = circuit_sub(in166, in0);
    let t405 = circuit_mul(in156, t404);
    let t406 = circuit_add(in0, t405);
    let t407 = circuit_mul(t341, t406);
    let t408 = circuit_add(in79, in80);
    let t409 = circuit_sub(t408, t403);
    let t410 = circuit_mul(t409, t346);
    let t411 = circuit_add(t345, t410);
    let t412 = circuit_mul(t346, in176);
    let t413 = circuit_sub(in157, in2);
    let t414 = circuit_mul(in0, t413);
    let t415 = circuit_sub(in157, in2);
    let t416 = circuit_mul(in3, t415);
    let t417 = circuit_inverse(t416);
    let t418 = circuit_mul(in79, t417);
    let t419 = circuit_add(in2, t418);
    let t420 = circuit_sub(in157, in0);
    let t421 = circuit_mul(t414, t420);
    let t422 = circuit_sub(in157, in0);
    let t423 = circuit_mul(in4, t422);
    let t424 = circuit_inverse(t423);
    let t425 = circuit_mul(in80, t424);
    let t426 = circuit_add(t419, t425);
    let t427 = circuit_sub(in157, in11);
    let t428 = circuit_mul(t421, t427);
    let t429 = circuit_sub(in157, in11);
    let t430 = circuit_mul(in5, t429);
    let t431 = circuit_inverse(t430);
    let t432 = circuit_mul(in81, t431);
    let t433 = circuit_add(t426, t432);
    let t434 = circuit_sub(in157, in12);
    let t435 = circuit_mul(t428, t434);
    let t436 = circuit_sub(in157, in12);
    let t437 = circuit_mul(in6, t436);
    let t438 = circuit_inverse(t437);
    let t439 = circuit_mul(in82, t438);
    let t440 = circuit_add(t433, t439);
    let t441 = circuit_sub(in157, in13);
    let t442 = circuit_mul(t435, t441);
    let t443 = circuit_sub(in157, in13);
    let t444 = circuit_mul(in7, t443);
    let t445 = circuit_inverse(t444);
    let t446 = circuit_mul(in83, t445);
    let t447 = circuit_add(t440, t446);
    let t448 = circuit_sub(in157, in14);
    let t449 = circuit_mul(t442, t448);
    let t450 = circuit_sub(in157, in14);
    let t451 = circuit_mul(in8, t450);
    let t452 = circuit_inverse(t451);
    let t453 = circuit_mul(in84, t452);
    let t454 = circuit_add(t447, t453);
    let t455 = circuit_sub(in157, in15);
    let t456 = circuit_mul(t449, t455);
    let t457 = circuit_sub(in157, in15);
    let t458 = circuit_mul(in9, t457);
    let t459 = circuit_inverse(t458);
    let t460 = circuit_mul(in85, t459);
    let t461 = circuit_add(t454, t460);
    let t462 = circuit_sub(in157, in16);
    let t463 = circuit_mul(t456, t462);
    let t464 = circuit_sub(in157, in16);
    let t465 = circuit_mul(in10, t464);
    let t466 = circuit_inverse(t465);
    let t467 = circuit_mul(in86, t466);
    let t468 = circuit_add(t461, t467);
    let t469 = circuit_mul(t468, t463);
    let t470 = circuit_sub(in167, in0);
    let t471 = circuit_mul(in157, t470);
    let t472 = circuit_add(in0, t471);
    let t473 = circuit_mul(t407, t472);
    let t474 = circuit_add(in87, in88);
    let t475 = circuit_sub(t474, t469);
    let t476 = circuit_mul(t475, t412);
    let t477 = circuit_add(t411, t476);
    let t478 = circuit_mul(t412, in176);
    let t479 = circuit_sub(in158, in2);
    let t480 = circuit_mul(in0, t479);
    let t481 = circuit_sub(in158, in2);
    let t482 = circuit_mul(in3, t481);
    let t483 = circuit_inverse(t482);
    let t484 = circuit_mul(in87, t483);
    let t485 = circuit_add(in2, t484);
    let t486 = circuit_sub(in158, in0);
    let t487 = circuit_mul(t480, t486);
    let t488 = circuit_sub(in158, in0);
    let t489 = circuit_mul(in4, t488);
    let t490 = circuit_inverse(t489);
    let t491 = circuit_mul(in88, t490);
    let t492 = circuit_add(t485, t491);
    let t493 = circuit_sub(in158, in11);
    let t494 = circuit_mul(t487, t493);
    let t495 = circuit_sub(in158, in11);
    let t496 = circuit_mul(in5, t495);
    let t497 = circuit_inverse(t496);
    let t498 = circuit_mul(in89, t497);
    let t499 = circuit_add(t492, t498);
    let t500 = circuit_sub(in158, in12);
    let t501 = circuit_mul(t494, t500);
    let t502 = circuit_sub(in158, in12);
    let t503 = circuit_mul(in6, t502);
    let t504 = circuit_inverse(t503);
    let t505 = circuit_mul(in90, t504);
    let t506 = circuit_add(t499, t505);
    let t507 = circuit_sub(in158, in13);
    let t508 = circuit_mul(t501, t507);
    let t509 = circuit_sub(in158, in13);
    let t510 = circuit_mul(in7, t509);
    let t511 = circuit_inverse(t510);
    let t512 = circuit_mul(in91, t511);
    let t513 = circuit_add(t506, t512);
    let t514 = circuit_sub(in158, in14);
    let t515 = circuit_mul(t508, t514);
    let t516 = circuit_sub(in158, in14);
    let t517 = circuit_mul(in8, t516);
    let t518 = circuit_inverse(t517);
    let t519 = circuit_mul(in92, t518);
    let t520 = circuit_add(t513, t519);
    let t521 = circuit_sub(in158, in15);
    let t522 = circuit_mul(t515, t521);
    let t523 = circuit_sub(in158, in15);
    let t524 = circuit_mul(in9, t523);
    let t525 = circuit_inverse(t524);
    let t526 = circuit_mul(in93, t525);
    let t527 = circuit_add(t520, t526);
    let t528 = circuit_sub(in158, in16);
    let t529 = circuit_mul(t522, t528);
    let t530 = circuit_sub(in158, in16);
    let t531 = circuit_mul(in10, t530);
    let t532 = circuit_inverse(t531);
    let t533 = circuit_mul(in94, t532);
    let t534 = circuit_add(t527, t533);
    let t535 = circuit_mul(t534, t529);
    let t536 = circuit_sub(in168, in0);
    let t537 = circuit_mul(in158, t536);
    let t538 = circuit_add(in0, t537);
    let t539 = circuit_mul(t473, t538);
    let t540 = circuit_add(in95, in96);
    let t541 = circuit_sub(t540, t535);
    let t542 = circuit_mul(t541, t478);
    let t543 = circuit_add(t477, t542);
    let t544 = circuit_mul(t478, in176);
    let t545 = circuit_sub(in159, in2);
    let t546 = circuit_mul(in0, t545);
    let t547 = circuit_sub(in159, in2);
    let t548 = circuit_mul(in3, t547);
    let t549 = circuit_inverse(t548);
    let t550 = circuit_mul(in95, t549);
    let t551 = circuit_add(in2, t550);
    let t552 = circuit_sub(in159, in0);
    let t553 = circuit_mul(t546, t552);
    let t554 = circuit_sub(in159, in0);
    let t555 = circuit_mul(in4, t554);
    let t556 = circuit_inverse(t555);
    let t557 = circuit_mul(in96, t556);
    let t558 = circuit_add(t551, t557);
    let t559 = circuit_sub(in159, in11);
    let t560 = circuit_mul(t553, t559);
    let t561 = circuit_sub(in159, in11);
    let t562 = circuit_mul(in5, t561);
    let t563 = circuit_inverse(t562);
    let t564 = circuit_mul(in97, t563);
    let t565 = circuit_add(t558, t564);
    let t566 = circuit_sub(in159, in12);
    let t567 = circuit_mul(t560, t566);
    let t568 = circuit_sub(in159, in12);
    let t569 = circuit_mul(in6, t568);
    let t570 = circuit_inverse(t569);
    let t571 = circuit_mul(in98, t570);
    let t572 = circuit_add(t565, t571);
    let t573 = circuit_sub(in159, in13);
    let t574 = circuit_mul(t567, t573);
    let t575 = circuit_sub(in159, in13);
    let t576 = circuit_mul(in7, t575);
    let t577 = circuit_inverse(t576);
    let t578 = circuit_mul(in99, t577);
    let t579 = circuit_add(t572, t578);
    let t580 = circuit_sub(in159, in14);
    let t581 = circuit_mul(t574, t580);
    let t582 = circuit_sub(in159, in14);
    let t583 = circuit_mul(in8, t582);
    let t584 = circuit_inverse(t583);
    let t585 = circuit_mul(in100, t584);
    let t586 = circuit_add(t579, t585);
    let t587 = circuit_sub(in159, in15);
    let t588 = circuit_mul(t581, t587);
    let t589 = circuit_sub(in159, in15);
    let t590 = circuit_mul(in9, t589);
    let t591 = circuit_inverse(t590);
    let t592 = circuit_mul(in101, t591);
    let t593 = circuit_add(t586, t592);
    let t594 = circuit_sub(in159, in16);
    let t595 = circuit_mul(t588, t594);
    let t596 = circuit_sub(in159, in16);
    let t597 = circuit_mul(in10, t596);
    let t598 = circuit_inverse(t597);
    let t599 = circuit_mul(in102, t598);
    let t600 = circuit_add(t593, t599);
    let t601 = circuit_mul(t600, t595);
    let t602 = circuit_sub(in169, in0);
    let t603 = circuit_mul(in159, t602);
    let t604 = circuit_add(in0, t603);
    let t605 = circuit_mul(t539, t604);
    let t606 = circuit_add(in103, in104);
    let t607 = circuit_sub(t606, t601);
    let t608 = circuit_mul(t607, t544);
    let t609 = circuit_add(t543, t608);
    let t610 = circuit_sub(in160, in2);
    let t611 = circuit_mul(in0, t610);
    let t612 = circuit_sub(in160, in2);
    let t613 = circuit_mul(in3, t612);
    let t614 = circuit_inverse(t613);
    let t615 = circuit_mul(in103, t614);
    let t616 = circuit_add(in2, t615);
    let t617 = circuit_sub(in160, in0);
    let t618 = circuit_mul(t611, t617);
    let t619 = circuit_sub(in160, in0);
    let t620 = circuit_mul(in4, t619);
    let t621 = circuit_inverse(t620);
    let t622 = circuit_mul(in104, t621);
    let t623 = circuit_add(t616, t622);
    let t624 = circuit_sub(in160, in11);
    let t625 = circuit_mul(t618, t624);
    let t626 = circuit_sub(in160, in11);
    let t627 = circuit_mul(in5, t626);
    let t628 = circuit_inverse(t627);
    let t629 = circuit_mul(in105, t628);
    let t630 = circuit_add(t623, t629);
    let t631 = circuit_sub(in160, in12);
    let t632 = circuit_mul(t625, t631);
    let t633 = circuit_sub(in160, in12);
    let t634 = circuit_mul(in6, t633);
    let t635 = circuit_inverse(t634);
    let t636 = circuit_mul(in106, t635);
    let t637 = circuit_add(t630, t636);
    let t638 = circuit_sub(in160, in13);
    let t639 = circuit_mul(t632, t638);
    let t640 = circuit_sub(in160, in13);
    let t641 = circuit_mul(in7, t640);
    let t642 = circuit_inverse(t641);
    let t643 = circuit_mul(in107, t642);
    let t644 = circuit_add(t637, t643);
    let t645 = circuit_sub(in160, in14);
    let t646 = circuit_mul(t639, t645);
    let t647 = circuit_sub(in160, in14);
    let t648 = circuit_mul(in8, t647);
    let t649 = circuit_inverse(t648);
    let t650 = circuit_mul(in108, t649);
    let t651 = circuit_add(t644, t650);
    let t652 = circuit_sub(in160, in15);
    let t653 = circuit_mul(t646, t652);
    let t654 = circuit_sub(in160, in15);
    let t655 = circuit_mul(in9, t654);
    let t656 = circuit_inverse(t655);
    let t657 = circuit_mul(in109, t656);
    let t658 = circuit_add(t651, t657);
    let t659 = circuit_sub(in160, in16);
    let t660 = circuit_mul(t653, t659);
    let t661 = circuit_sub(in160, in16);
    let t662 = circuit_mul(in10, t661);
    let t663 = circuit_inverse(t662);
    let t664 = circuit_mul(in110, t663);
    let t665 = circuit_add(t658, t664);
    let t666 = circuit_mul(t665, t660);
    let t667 = circuit_sub(in170, in0);
    let t668 = circuit_mul(in160, t667);
    let t669 = circuit_add(in0, t668);
    let t670 = circuit_mul(t605, t669);
    let t671 = circuit_sub(in117, in12);
    let t672 = circuit_mul(t671, in111);
    let t673 = circuit_mul(t672, in139);
    let t674 = circuit_mul(t673, in138);
    let t675 = circuit_mul(t674, in17);
    let t676 = circuit_mul(in113, in138);
    let t677 = circuit_mul(in114, in139);
    let t678 = circuit_mul(in115, in140);
    let t679 = circuit_mul(in116, in141);
    let t680 = circuit_add(t675, t676);
    let t681 = circuit_add(t680, t677);
    let t682 = circuit_add(t681, t678);
    let t683 = circuit_add(t682, t679);
    let t684 = circuit_add(t683, in112);
    let t685 = circuit_sub(in117, in0);
    let t686 = circuit_mul(t685, in149);
    let t687 = circuit_add(t684, t686);
    let t688 = circuit_mul(t687, in117);
    let t689 = circuit_mul(t688, t670);
    let t690 = circuit_add(in138, in141);
    let t691 = circuit_add(t690, in111);
    let t692 = circuit_sub(t691, in146);
    let t693 = circuit_sub(in117, in11);
    let t694 = circuit_mul(t692, t693);
    let t695 = circuit_sub(in117, in0);
    let t696 = circuit_mul(t694, t695);
    let t697 = circuit_mul(t696, in117);
    let t698 = circuit_mul(t697, t670);
    let t699 = circuit_mul(in128, in174);
    let t700 = circuit_add(in138, t699);
    let t701 = circuit_add(t700, in175);
    let t702 = circuit_mul(in129, in174);
    let t703 = circuit_add(in139, t702);
    let t704 = circuit_add(t703, in175);
    let t705 = circuit_mul(t701, t704);
    let t706 = circuit_mul(in130, in174);
    let t707 = circuit_add(in140, t706);
    let t708 = circuit_add(t707, in175);
    let t709 = circuit_mul(t705, t708);
    let t710 = circuit_mul(in131, in174);
    let t711 = circuit_add(in141, t710);
    let t712 = circuit_add(t711, in175);
    let t713 = circuit_mul(t709, t712);
    let t714 = circuit_mul(in124, in174);
    let t715 = circuit_add(in138, t714);
    let t716 = circuit_add(t715, in175);
    let t717 = circuit_mul(in125, in174);
    let t718 = circuit_add(in139, t717);
    let t719 = circuit_add(t718, in175);
    let t720 = circuit_mul(t716, t719);
    let t721 = circuit_mul(in126, in174);
    let t722 = circuit_add(in140, t721);
    let t723 = circuit_add(t722, in175);
    let t724 = circuit_mul(t720, t723);
    let t725 = circuit_mul(in127, in174);
    let t726 = circuit_add(in141, t725);
    let t727 = circuit_add(t726, in175);
    let t728 = circuit_mul(t724, t727);
    let t729 = circuit_add(in142, in136);
    let t730 = circuit_mul(t713, t729);
    let t731 = circuit_mul(in137, t11);
    let t732 = circuit_add(in150, t731);
    let t733 = circuit_mul(t728, t732);
    let t734 = circuit_sub(t730, t733);
    let t735 = circuit_mul(t734, t670);
    let t736 = circuit_mul(in137, in150);
    let t737 = circuit_mul(t736, t670);
    let t738 = circuit_mul(in133, in171);
    let t739 = circuit_mul(in134, in172);
    let t740 = circuit_mul(in135, in173);
    let t741 = circuit_add(in132, in175);
    let t742 = circuit_add(t741, t738);
    let t743 = circuit_add(t742, t739);
    let t744 = circuit_add(t743, t740);
    let t745 = circuit_mul(in114, in146);
    let t746 = circuit_add(in138, in175);
    let t747 = circuit_add(t746, t745);
    let t748 = circuit_mul(in111, in147);
    let t749 = circuit_add(in139, t748);
    let t750 = circuit_mul(in112, in148);
    let t751 = circuit_add(in140, t750);
    let t752 = circuit_mul(t749, in171);
    let t753 = circuit_mul(t751, in172);
    let t754 = circuit_mul(in115, in173);
    let t755 = circuit_add(t747, t752);
    let t756 = circuit_add(t755, t753);
    let t757 = circuit_add(t756, t754);
    let t758 = circuit_mul(in143, t744);
    let t759 = circuit_mul(in143, t757);
    let t760 = circuit_add(in145, in121);
    let t761 = circuit_mul(in145, in121);
    let t762 = circuit_sub(t760, t761);
    let t763 = circuit_mul(t757, t744);
    let t764 = circuit_mul(t763, in143);
    let t765 = circuit_sub(t764, t762);
    let t766 = circuit_mul(t765, t670);
    let t767 = circuit_mul(in121, t758);
    let t768 = circuit_mul(in144, t759);
    let t769 = circuit_sub(t767, t768);
    let t770 = circuit_sub(in139, in138);
    let t771 = circuit_sub(in140, in139);
    let t772 = circuit_sub(in141, in140);
    let t773 = circuit_sub(in146, in141);
    let t774 = circuit_add(t770, in18);
    let t775 = circuit_add(t770, in19);
    let t776 = circuit_add(t770, in20);
    let t777 = circuit_mul(t770, t774);
    let t778 = circuit_mul(t777, t775);
    let t779 = circuit_mul(t778, t776);
    let t780 = circuit_mul(t779, in118);
    let t781 = circuit_mul(t780, t670);
    let t782 = circuit_add(t771, in18);
    let t783 = circuit_add(t771, in19);
    let t784 = circuit_add(t771, in20);
    let t785 = circuit_mul(t771, t782);
    let t786 = circuit_mul(t785, t783);
    let t787 = circuit_mul(t786, t784);
    let t788 = circuit_mul(t787, in118);
    let t789 = circuit_mul(t788, t670);
    let t790 = circuit_add(t772, in18);
    let t791 = circuit_add(t772, in19);
    let t792 = circuit_add(t772, in20);
    let t793 = circuit_mul(t772, t790);
    let t794 = circuit_mul(t793, t791);
    let t795 = circuit_mul(t794, t792);
    let t796 = circuit_mul(t795, in118);
    let t797 = circuit_mul(t796, t670);
    let t798 = circuit_add(t773, in18);
    let t799 = circuit_add(t773, in19);
    let t800 = circuit_add(t773, in20);
    let t801 = circuit_mul(t773, t798);
    let t802 = circuit_mul(t801, t799);
    let t803 = circuit_mul(t802, t800);
    let t804 = circuit_mul(t803, in118);
    let t805 = circuit_mul(t804, t670);
    let t806 = circuit_sub(in146, in139);
    let t807 = circuit_mul(in140, in140);
    let t808 = circuit_mul(in149, in149);
    let t809 = circuit_mul(in140, in149);
    let t810 = circuit_mul(t809, in113);
    let t811 = circuit_add(in147, in146);
    let t812 = circuit_add(t811, in139);
    let t813 = circuit_mul(t812, t806);
    let t814 = circuit_mul(t813, t806);
    let t815 = circuit_sub(t814, t808);
    let t816 = circuit_sub(t815, t807);
    let t817 = circuit_add(t816, t810);
    let t818 = circuit_add(t817, t810);
    let t819 = circuit_sub(in0, in111);
    let t820 = circuit_mul(t818, t670);
    let t821 = circuit_mul(t820, in119);
    let t822 = circuit_mul(t821, t819);
    let t823 = circuit_add(in140, in148);
    let t824 = circuit_mul(in149, in113);
    let t825 = circuit_sub(t824, in140);
    let t826 = circuit_mul(t823, t806);
    let t827 = circuit_sub(in147, in139);
    let t828 = circuit_mul(t827, t825);
    let t829 = circuit_add(t826, t828);
    let t830 = circuit_mul(t829, t670);
    let t831 = circuit_mul(t830, in119);
    let t832 = circuit_mul(t831, t819);
    let t833 = circuit_add(t807, in21);
    let t834 = circuit_mul(t833, in139);
    let t835 = circuit_add(t807, t807);
    let t836 = circuit_add(t835, t835);
    let t837 = circuit_mul(t834, in22);
    let t838 = circuit_add(in147, in139);
    let t839 = circuit_add(t838, in139);
    let t840 = circuit_mul(t839, t836);
    let t841 = circuit_sub(t840, t837);
    let t842 = circuit_mul(t841, t670);
    let t843 = circuit_mul(t842, in119);
    let t844 = circuit_mul(t843, in111);
    let t845 = circuit_add(t822, t844);
    let t846 = circuit_add(in139, in139);
    let t847 = circuit_add(t846, in139);
    let t848 = circuit_mul(t847, in139);
    let t849 = circuit_sub(in139, in147);
    let t850 = circuit_mul(t848, t849);
    let t851 = circuit_add(in140, in140);
    let t852 = circuit_add(in140, in148);
    let t853 = circuit_mul(t851, t852);
    let t854 = circuit_sub(t850, t853);
    let t855 = circuit_mul(t854, t670);
    let t856 = circuit_mul(t855, in119);
    let t857 = circuit_mul(t856, in111);
    let t858 = circuit_add(t832, t857);
    let t859 = circuit_mul(in138, in147);
    let t860 = circuit_mul(in146, in139);
    let t861 = circuit_add(t859, t860);
    let t862 = circuit_mul(in138, in141);
    let t863 = circuit_mul(in139, in140);
    let t864 = circuit_add(t862, t863);
    let t865 = circuit_sub(t864, in148);
    let t866 = circuit_mul(t865, in23);
    let t867 = circuit_sub(t866, in149);
    let t868 = circuit_add(t867, t861);
    let t869 = circuit_mul(t868, in116);
    let t870 = circuit_mul(t861, in23);
    let t871 = circuit_mul(in146, in147);
    let t872 = circuit_add(t870, t871);
    let t873 = circuit_add(in140, in141);
    let t874 = circuit_sub(t872, t873);
    let t875 = circuit_mul(t874, in115);
    let t876 = circuit_add(t872, in141);
    let t877 = circuit_add(in148, in149);
    let t878 = circuit_sub(t876, t877);
    let t879 = circuit_mul(t878, in111);
    let t880 = circuit_add(t875, t869);
    let t881 = circuit_add(t880, t879);
    let t882 = circuit_mul(t881, in114);
    let t883 = circuit_mul(in147, in24);
    let t884 = circuit_add(t883, in146);
    let t885 = circuit_mul(t884, in24);
    let t886 = circuit_add(t885, in140);
    let t887 = circuit_mul(t886, in24);
    let t888 = circuit_add(t887, in139);
    let t889 = circuit_mul(t888, in24);
    let t890 = circuit_add(t889, in138);
    let t891 = circuit_sub(t890, in141);
    let t892 = circuit_mul(t891, in116);
    let t893 = circuit_mul(in148, in24);
    let t894 = circuit_add(t893, in147);
    let t895 = circuit_mul(t894, in24);
    let t896 = circuit_add(t895, in146);
    let t897 = circuit_mul(t896, in24);
    let t898 = circuit_add(t897, in141);
    let t899 = circuit_mul(t898, in24);
    let t900 = circuit_add(t899, in140);
    let t901 = circuit_sub(t900, in149);
    let t902 = circuit_mul(t901, in111);
    let t903 = circuit_add(t892, t902);
    let t904 = circuit_mul(t903, in115);
    let t905 = circuit_mul(in140, in173);
    let t906 = circuit_mul(in139, in172);
    let t907 = circuit_mul(in138, in171);
    let t908 = circuit_add(t905, t906);
    let t909 = circuit_add(t908, t907);
    let t910 = circuit_add(t909, in112);
    let t911 = circuit_sub(t910, in141);
    let t912 = circuit_sub(in146, in138);
    let t913 = circuit_sub(in149, in141);
    let t914 = circuit_mul(t912, t912);
    let t915 = circuit_sub(t914, t912);
    let t916 = circuit_sub(in2, t912);
    let t917 = circuit_add(t916, in0);
    let t918 = circuit_mul(t917, t913);
    let t919 = circuit_mul(in113, in114);
    let t920 = circuit_mul(t919, in120);
    let t921 = circuit_mul(t920, t670);
    let t922 = circuit_mul(t918, t921);
    let t923 = circuit_mul(t915, t921);
    let t924 = circuit_mul(t911, t919);
    let t925 = circuit_sub(in141, t910);
    let t926 = circuit_mul(t925, t925);
    let t927 = circuit_sub(t926, t925);
    let t928 = circuit_mul(in148, in173);
    let t929 = circuit_mul(in147, in172);
    let t930 = circuit_mul(in146, in171);
    let t931 = circuit_add(t928, t929);
    let t932 = circuit_add(t931, t930);
    let t933 = circuit_sub(in149, t932);
    let t934 = circuit_sub(in148, in140);
    let t935 = circuit_sub(in2, t912);
    let t936 = circuit_add(t935, in0);
    let t937 = circuit_sub(in2, t933);
    let t938 = circuit_add(t937, in0);
    let t939 = circuit_mul(t934, t938);
    let t940 = circuit_mul(t936, t939);
    let t941 = circuit_mul(t933, t933);
    let t942 = circuit_sub(t941, t933);
    let t943 = circuit_mul(in117, in120);
    let t944 = circuit_mul(t943, t670);
    let t945 = circuit_mul(t940, t944);
    let t946 = circuit_mul(t915, t944);
    let t947 = circuit_mul(t942, t944);
    let t948 = circuit_mul(t927, in117);
    let t949 = circuit_sub(in147, in139);
    let t950 = circuit_sub(in2, t912);
    let t951 = circuit_add(t950, in0);
    let t952 = circuit_mul(t951, t949);
    let t953 = circuit_sub(t952, in140);
    let t954 = circuit_mul(t953, in116);
    let t955 = circuit_mul(t954, in113);
    let t956 = circuit_add(t924, t955);
    let t957 = circuit_mul(t911, in111);
    let t958 = circuit_mul(t957, in113);
    let t959 = circuit_add(t956, t958);
    let t960 = circuit_add(t959, t948);
    let t961 = circuit_add(t960, t882);
    let t962 = circuit_add(t961, t904);
    let t963 = circuit_mul(t962, in120);
    let t964 = circuit_mul(t963, t670);
    let t965 = circuit_add(in138, in113);
    let t966 = circuit_add(in139, in114);
    let t967 = circuit_add(in140, in115);
    let t968 = circuit_add(in141, in116);
    let t969 = circuit_mul(t965, t965);
    let t970 = circuit_mul(t969, t969);
    let t971 = circuit_mul(t970, t965);
    let t972 = circuit_mul(t966, t966);
    let t973 = circuit_mul(t972, t972);
    let t974 = circuit_mul(t973, t966);
    let t975 = circuit_mul(t967, t967);
    let t976 = circuit_mul(t975, t975);
    let t977 = circuit_mul(t976, t967);
    let t978 = circuit_mul(t968, t968);
    let t979 = circuit_mul(t978, t978);
    let t980 = circuit_mul(t979, t968);
    let t981 = circuit_add(t971, t974);
    let t982 = circuit_add(t977, t980);
    let t983 = circuit_add(t974, t974);
    let t984 = circuit_add(t983, t982);
    let t985 = circuit_add(t980, t980);
    let t986 = circuit_add(t985, t981);
    let t987 = circuit_add(t982, t982);
    let t988 = circuit_add(t987, t987);
    let t989 = circuit_add(t988, t986);
    let t990 = circuit_add(t981, t981);
    let t991 = circuit_add(t990, t990);
    let t992 = circuit_add(t991, t984);
    let t993 = circuit_add(t986, t992);
    let t994 = circuit_add(t984, t989);
    let t995 = circuit_mul(in122, t670);
    let t996 = circuit_sub(t993, in146);
    let t997 = circuit_mul(t995, t996);
    let t998 = circuit_sub(t992, in147);
    let t999 = circuit_mul(t995, t998);
    let t1000 = circuit_sub(t994, in148);
    let t1001 = circuit_mul(t995, t1000);
    let t1002 = circuit_sub(t989, in149);
    let t1003 = circuit_mul(t995, t1002);
    let t1004 = circuit_add(in138, in113);
    let t1005 = circuit_mul(t1004, t1004);
    let t1006 = circuit_mul(t1005, t1005);
    let t1007 = circuit_mul(t1006, t1004);
    let t1008 = circuit_add(t1007, in139);
    let t1009 = circuit_add(t1008, in140);
    let t1010 = circuit_add(t1009, in141);
    let t1011 = circuit_mul(in123, t670);
    let t1012 = circuit_mul(t1007, in25);
    let t1013 = circuit_add(t1012, t1010);
    let t1014 = circuit_sub(t1013, in146);
    let t1015 = circuit_mul(t1011, t1014);
    let t1016 = circuit_mul(in139, in26);
    let t1017 = circuit_add(t1016, t1010);
    let t1018 = circuit_sub(t1017, in147);
    let t1019 = circuit_mul(t1011, t1018);
    let t1020 = circuit_mul(in140, in27);
    let t1021 = circuit_add(t1020, t1010);
    let t1022 = circuit_sub(t1021, in148);
    let t1023 = circuit_mul(t1011, t1022);
    let t1024 = circuit_mul(in141, in28);
    let t1025 = circuit_add(t1024, t1010);
    let t1026 = circuit_sub(t1025, in149);
    let t1027 = circuit_mul(t1011, t1026);
    let t1028 = circuit_mul(t698, in177);
    let t1029 = circuit_add(t689, t1028);
    let t1030 = circuit_mul(t735, in178);
    let t1031 = circuit_add(t1029, t1030);
    let t1032 = circuit_mul(t737, in179);
    let t1033 = circuit_add(t1031, t1032);
    let t1034 = circuit_mul(t766, in180);
    let t1035 = circuit_add(t1033, t1034);
    let t1036 = circuit_mul(t769, in181);
    let t1037 = circuit_add(t1035, t1036);
    let t1038 = circuit_mul(t781, in182);
    let t1039 = circuit_add(t1037, t1038);
    let t1040 = circuit_mul(t789, in183);
    let t1041 = circuit_add(t1039, t1040);
    let t1042 = circuit_mul(t797, in184);
    let t1043 = circuit_add(t1041, t1042);
    let t1044 = circuit_mul(t805, in185);
    let t1045 = circuit_add(t1043, t1044);
    let t1046 = circuit_mul(t845, in186);
    let t1047 = circuit_add(t1045, t1046);
    let t1048 = circuit_mul(t858, in187);
    let t1049 = circuit_add(t1047, t1048);
    let t1050 = circuit_mul(t964, in188);
    let t1051 = circuit_add(t1049, t1050);
    let t1052 = circuit_mul(t922, in189);
    let t1053 = circuit_add(t1051, t1052);
    let t1054 = circuit_mul(t923, in190);
    let t1055 = circuit_add(t1053, t1054);
    let t1056 = circuit_mul(t945, in191);
    let t1057 = circuit_add(t1055, t1056);
    let t1058 = circuit_mul(t946, in192);
    let t1059 = circuit_add(t1057, t1058);
    let t1060 = circuit_mul(t947, in193);
    let t1061 = circuit_add(t1059, t1060);
    let t1062 = circuit_mul(t997, in194);
    let t1063 = circuit_add(t1061, t1062);
    let t1064 = circuit_mul(t999, in195);
    let t1065 = circuit_add(t1063, t1064);
    let t1066 = circuit_mul(t1001, in196);
    let t1067 = circuit_add(t1065, t1066);
    let t1068 = circuit_mul(t1003, in197);
    let t1069 = circuit_add(t1067, t1068);
    let t1070 = circuit_mul(t1015, in198);
    let t1071 = circuit_add(t1069, t1070);
    let t1072 = circuit_mul(t1019, in199);
    let t1073 = circuit_add(t1071, t1072);
    let t1074 = circuit_mul(t1023, in200);
    let t1075 = circuit_add(t1073, t1074);
    let t1076 = circuit_mul(t1027, in201);
    let t1077 = circuit_add(t1075, t1076);
    let t1078 = circuit_sub(t1077, t666);

    let modulus = get_GRUMPKIN_modulus(); // GRUMPKIN prime field modulus

    let mut circuit_inputs = (t609, t1078).new_inputs();
    // Prefill constants:

    circuit_inputs = circuit_inputs
        .next_span(HONK_SUMCHECK_SIZE_10_PUB_1_GRUMPKIN_CONSTANTS.span()); // in0 - in28

    // Fill inputs:

    let mut p_public_inputs = p_public_inputs;
    while let Option::Some(val) = p_public_inputs.pop_front() {
        circuit_inputs = circuit_inputs.next_u256(*val);
    }; // in29 - in29

    circuit_inputs = circuit_inputs.next_2(p_public_inputs_offset); // in30

    let mut sumcheck_univariates_flat = sumcheck_univariates_flat;
    while let Option::Some(val) = sumcheck_univariates_flat.pop_front() {
        circuit_inputs = circuit_inputs.next_u256(*val);
    }; // in31 - in110

    let mut sumcheck_evaluations = sumcheck_evaluations;
    while let Option::Some(val) = sumcheck_evaluations.pop_front() {
        circuit_inputs = circuit_inputs.next_u256(*val);
    }; // in111 - in150

    let mut tp_sum_check_u_challenges = tp_sum_check_u_challenges;
    while let Option::Some(val) = tp_sum_check_u_challenges.pop_front() {
        circuit_inputs = circuit_inputs.next_u128(*val);
    }; // in151 - in160

    let mut tp_gate_challenges = tp_gate_challenges;
    while let Option::Some(val) = tp_gate_challenges.pop_front() {
        circuit_inputs = circuit_inputs.next_u128(*val);
    }; // in161 - in170

    circuit_inputs = circuit_inputs.next_2(tp_eta_1); // in171
    circuit_inputs = circuit_inputs.next_2(tp_eta_2); // in172
    circuit_inputs = circuit_inputs.next_2(tp_eta_3); // in173
    circuit_inputs = circuit_inputs.next_2(tp_beta); // in174
    circuit_inputs = circuit_inputs.next_2(tp_gamma); // in175
    circuit_inputs = circuit_inputs.next_2(tp_base_rlc); // in176

    let mut tp_alphas = tp_alphas;
    while let Option::Some(val) = tp_alphas.pop_front() {
        circuit_inputs = circuit_inputs.next_u128(*val);
    }; // in177 - in201

    let outputs = circuit_inputs.done_2().eval(modulus).unwrap();
    let check_rlc: u384 = outputs.get_output(t609);
    let check: u384 = outputs.get_output(t1078);
    return (check_rlc, check);
}
const HONK_SUMCHECK_SIZE_10_PUB_1_GRUMPKIN_CONSTANTS: [u384; 29] = [
    u384 { limb0: 0x1, limb1: 0x0, limb2: 0x0, limb3: 0x0 },
    u384 { limb0: 0x400, limb1: 0x0, limb2: 0x0, limb3: 0x0 },
    u384 { limb0: 0x0, limb1: 0x0, limb2: 0x0, limb3: 0x0 },
    u384 {
        limb0: 0x79b9709143e1f593efffec51,
        limb1: 0xb85045b68181585d2833e848,
        limb2: 0x30644e72e131a029,
        limb3: 0x0,
    },
    u384 { limb0: 0x2d0, limb1: 0x0, limb2: 0x0, limb3: 0x0 },
    u384 {
        limb0: 0x79b9709143e1f593efffff11,
        limb1: 0xb85045b68181585d2833e848,
        limb2: 0x30644e72e131a029,
        limb3: 0x0,
    },
    u384 { limb0: 0x90, limb1: 0x0, limb2: 0x0, limb3: 0x0 },
    u384 {
        limb0: 0x79b9709143e1f593efffff71,
        limb1: 0xb85045b68181585d2833e848,
        limb2: 0x30644e72e131a029,
        limb3: 0x0,
    },
    u384 { limb0: 0xf0, limb1: 0x0, limb2: 0x0, limb3: 0x0 },
    u384 {
        limb0: 0x79b9709143e1f593effffd31,
        limb1: 0xb85045b68181585d2833e848,
        limb2: 0x30644e72e131a029,
        limb3: 0x0,
    },
    u384 { limb0: 0x13b0, limb1: 0x0, limb2: 0x0, limb3: 0x0 },
    u384 { limb0: 0x2, limb1: 0x0, limb2: 0x0, limb3: 0x0 },
    u384 { limb0: 0x3, limb1: 0x0, limb2: 0x0, limb3: 0x0 },
    u384 { limb0: 0x4, limb1: 0x0, limb2: 0x0, limb3: 0x0 },
    u384 { limb0: 0x5, limb1: 0x0, limb2: 0x0, limb3: 0x0 },
    u384 { limb0: 0x6, limb1: 0x0, limb2: 0x0, limb3: 0x0 },
    u384 { limb0: 0x7, limb1: 0x0, limb2: 0x0, limb3: 0x0 },
    u384 {
        limb0: 0x3cdcb848a1f0fac9f8000000,
        limb1: 0xdc2822db40c0ac2e9419f424,
        limb2: 0x183227397098d014,
        limb3: 0x0,
    },
    u384 {
        limb0: 0x79b9709143e1f593f0000000,
        limb1: 0xb85045b68181585d2833e848,
        limb2: 0x30644e72e131a029,
        limb3: 0x0,
    },
    u384 {
        limb0: 0x79b9709143e1f593efffffff,
        limb1: 0xb85045b68181585d2833e848,
        limb2: 0x30644e72e131a029,
        limb3: 0x0,
    },
    u384 {
        limb0: 0x79b9709143e1f593effffffe,
        limb1: 0xb85045b68181585d2833e848,
        limb2: 0x30644e72e131a029,
        limb3: 0x0,
    },
    u384 { limb0: 0x11, limb1: 0x0, limb2: 0x0, limb3: 0x0 },
    u384 { limb0: 0x9, limb1: 0x0, limb2: 0x0, limb3: 0x0 },
    u384 { limb0: 0x100000000000000000, limb1: 0x0, limb2: 0x0, limb3: 0x0 },
    u384 { limb0: 0x4000, limb1: 0x0, limb2: 0x0, limb3: 0x0 },
    u384 {
        limb0: 0x29ca1d7fb56821fd19d3b6e7,
        limb1: 0x4b1e03b4bd9490c0d03f989,
        limb2: 0x10dc6e9c006ea38b,
        limb3: 0x0,
    },
    u384 {
        limb0: 0xd4dd9b84a86b38cfb45a740b,
        limb1: 0x149b3d0a30b3bb599df9756,
        limb2: 0xc28145b6a44df3e,
        limb3: 0x0,
    },
    u384 {
        limb0: 0x60e3596170067d00141cac15,
        limb1: 0xb2c7645a50392798b21f75bb,
        limb2: 0x544b8338791518,
        limb3: 0x0,
    },
    u384 {
        limb0: 0xb8fa852613bc534433ee428b,
        limb1: 0x2e2e82eb122789e352e105a3,
        limb2: 0x222c01175718386f,
        limb3: 0x0,
    },
];
#[inline(always)]
pub fn run_GRUMPKIN_HONK_PREP_MSM_SCALARS_SIZE_10_circuit(
    p_sumcheck_evaluations: Span<u256>,
    p_gemini_a_evaluations: Span<u256>,
    tp_gemini_r: u384,
    tp_rho: u384,
    tp_shplonk_z: u384,
    tp_shplonk_nu: u384,
    tp_sum_check_u_challenges: Span<u128>,
) -> (
    u384,
    u384,
    u384,
    u384,
    u384,
    u384,
    u384,
    u384,
    u384,
    u384,
    u384,
    u384,
    u384,
    u384,
    u384,
    u384,
    u384,
    u384,
    u384,
    u384,
    u384,
    u384,
    u384,
    u384,
    u384,
    u384,
    u384,
    u384,
    u384,
    u384,
    u384,
    u384,
    u384,
    u384,
    u384,
    u384,
    u384,
    u384,
    u384,
    u384,
    u384,
    u384,
    u384,
    u384,
    u384,
    u384,
    u384,
) {
    // CONSTANT stack
    let in0 = CE::<CI<0>> {}; // 0x0
    let in1 = CE::<CI<1>> {}; // 0x1

    // INPUT stack
    let (in2, in3, in4) = (CE::<CI<2>> {}, CE::<CI<3>> {}, CE::<CI<4>> {});
    let (in5, in6, in7) = (CE::<CI<5>> {}, CE::<CI<6>> {}, CE::<CI<7>> {});
    let (in8, in9, in10) = (CE::<CI<8>> {}, CE::<CI<9>> {}, CE::<CI<10>> {});
    let (in11, in12, in13) = (CE::<CI<11>> {}, CE::<CI<12>> {}, CE::<CI<13>> {});
    let (in14, in15, in16) = (CE::<CI<14>> {}, CE::<CI<15>> {}, CE::<CI<16>> {});
    let (in17, in18, in19) = (CE::<CI<17>> {}, CE::<CI<18>> {}, CE::<CI<19>> {});
    let (in20, in21, in22) = (CE::<CI<20>> {}, CE::<CI<21>> {}, CE::<CI<22>> {});
    let (in23, in24, in25) = (CE::<CI<23>> {}, CE::<CI<24>> {}, CE::<CI<25>> {});
    let (in26, in27, in28) = (CE::<CI<26>> {}, CE::<CI<27>> {}, CE::<CI<28>> {});
    let (in29, in30, in31) = (CE::<CI<29>> {}, CE::<CI<30>> {}, CE::<CI<31>> {});
    let (in32, in33, in34) = (CE::<CI<32>> {}, CE::<CI<33>> {}, CE::<CI<34>> {});
    let (in35, in36, in37) = (CE::<CI<35>> {}, CE::<CI<36>> {}, CE::<CI<37>> {});
    let (in38, in39, in40) = (CE::<CI<38>> {}, CE::<CI<39>> {}, CE::<CI<40>> {});
    let (in41, in42, in43) = (CE::<CI<41>> {}, CE::<CI<42>> {}, CE::<CI<43>> {});
    let (in44, in45, in46) = (CE::<CI<44>> {}, CE::<CI<45>> {}, CE::<CI<46>> {});
    let (in47, in48, in49) = (CE::<CI<47>> {}, CE::<CI<48>> {}, CE::<CI<49>> {});
    let (in50, in51, in52) = (CE::<CI<50>> {}, CE::<CI<51>> {}, CE::<CI<52>> {});
    let (in53, in54, in55) = (CE::<CI<53>> {}, CE::<CI<54>> {}, CE::<CI<55>> {});
    let (in56, in57, in58) = (CE::<CI<56>> {}, CE::<CI<57>> {}, CE::<CI<58>> {});
    let (in59, in60, in61) = (CE::<CI<59>> {}, CE::<CI<60>> {}, CE::<CI<61>> {});
    let (in62, in63, in64) = (CE::<CI<62>> {}, CE::<CI<63>> {}, CE::<CI<64>> {});
    let (in65, in66, in67) = (CE::<CI<65>> {}, CE::<CI<66>> {}, CE::<CI<67>> {});
    let (in68, in69) = (CE::<CI<68>> {}, CE::<CI<69>> {});
    let t0 = circuit_mul(in56, in56);
    let t1 = circuit_mul(t0, t0);
    let t2 = circuit_mul(t1, t1);
    let t3 = circuit_mul(t2, t2);
    let t4 = circuit_mul(t3, t3);
    let t5 = circuit_mul(t4, t4);
    let t6 = circuit_mul(t5, t5);
    let t7 = circuit_mul(t6, t6);
    let t8 = circuit_mul(t7, t7);
    let t9 = circuit_sub(in58, in56);
    let t10 = circuit_inverse(t9);
    let t11 = circuit_add(in58, in56);
    let t12 = circuit_inverse(t11);
    let t13 = circuit_add(in58, t0);
    let t14 = circuit_inverse(t13);
    let t15 = circuit_add(in58, t1);
    let t16 = circuit_inverse(t15);
    let t17 = circuit_add(in58, t2);
    let t18 = circuit_inverse(t17);
    let t19 = circuit_add(in58, t3);
    let t20 = circuit_inverse(t19);
    let t21 = circuit_add(in58, t4);
    let t22 = circuit_inverse(t21);
    let t23 = circuit_add(in58, t5);
    let t24 = circuit_inverse(t23);
    let t25 = circuit_add(in58, t6);
    let t26 = circuit_inverse(t25);
    let t27 = circuit_add(in58, t7);
    let t28 = circuit_inverse(t27);
    let t29 = circuit_add(in58, t8);
    let t30 = circuit_inverse(t29);
    let t31 = circuit_mul(in59, t12);
    let t32 = circuit_add(t10, t31);
    let t33 = circuit_sub(in0, t32);
    let t34 = circuit_inverse(in56);
    let t35 = circuit_mul(in59, t12);
    let t36 = circuit_sub(t10, t35);
    let t37 = circuit_mul(t34, t36);
    let t38 = circuit_sub(in0, t37);
    let t39 = circuit_mul(t33, in1);
    let t40 = circuit_mul(in2, in1);
    let t41 = circuit_add(in0, t40);
    let t42 = circuit_mul(in1, in57);
    let t43 = circuit_mul(t33, t42);
    let t44 = circuit_mul(in3, t42);
    let t45 = circuit_add(t41, t44);
    let t46 = circuit_mul(t42, in57);
    let t47 = circuit_mul(t33, t46);
    let t48 = circuit_mul(in4, t46);
    let t49 = circuit_add(t45, t48);
    let t50 = circuit_mul(t46, in57);
    let t51 = circuit_mul(t33, t50);
    let t52 = circuit_mul(in5, t50);
    let t53 = circuit_add(t49, t52);
    let t54 = circuit_mul(t50, in57);
    let t55 = circuit_mul(t33, t54);
    let t56 = circuit_mul(in6, t54);
    let t57 = circuit_add(t53, t56);
    let t58 = circuit_mul(t54, in57);
    let t59 = circuit_mul(t33, t58);
    let t60 = circuit_mul(in7, t58);
    let t61 = circuit_add(t57, t60);
    let t62 = circuit_mul(t58, in57);
    let t63 = circuit_mul(t33, t62);
    let t64 = circuit_mul(in8, t62);
    let t65 = circuit_add(t61, t64);
    let t66 = circuit_mul(t62, in57);
    let t67 = circuit_mul(t33, t66);
    let t68 = circuit_mul(in9, t66);
    let t69 = circuit_add(t65, t68);
    let t70 = circuit_mul(t66, in57);
    let t71 = circuit_mul(t33, t70);
    let t72 = circuit_mul(in10, t70);
    let t73 = circuit_add(t69, t72);
    let t74 = circuit_mul(t70, in57);
    let t75 = circuit_mul(t33, t74);
    let t76 = circuit_mul(in11, t74);
    let t77 = circuit_add(t73, t76);
    let t78 = circuit_mul(t74, in57);
    let t79 = circuit_mul(t33, t78);
    let t80 = circuit_mul(in12, t78);
    let t81 = circuit_add(t77, t80);
    let t82 = circuit_mul(t78, in57);
    let t83 = circuit_mul(t33, t82);
    let t84 = circuit_mul(in13, t82);
    let t85 = circuit_add(t81, t84);
    let t86 = circuit_mul(t82, in57);
    let t87 = circuit_mul(t33, t86);
    let t88 = circuit_mul(in14, t86);
    let t89 = circuit_add(t85, t88);
    let t90 = circuit_mul(t86, in57);
    let t91 = circuit_mul(t33, t90);
    let t92 = circuit_mul(in15, t90);
    let t93 = circuit_add(t89, t92);
    let t94 = circuit_mul(t90, in57);
    let t95 = circuit_mul(t33, t94);
    let t96 = circuit_mul(in16, t94);
    let t97 = circuit_add(t93, t96);
    let t98 = circuit_mul(t94, in57);
    let t99 = circuit_mul(t33, t98);
    let t100 = circuit_mul(in17, t98);
    let t101 = circuit_add(t97, t100);
    let t102 = circuit_mul(t98, in57);
    let t103 = circuit_mul(t33, t102);
    let t104 = circuit_mul(in18, t102);
    let t105 = circuit_add(t101, t104);
    let t106 = circuit_mul(t102, in57);
    let t107 = circuit_mul(t33, t106);
    let t108 = circuit_mul(in19, t106);
    let t109 = circuit_add(t105, t108);
    let t110 = circuit_mul(t106, in57);
    let t111 = circuit_mul(t33, t110);
    let t112 = circuit_mul(in20, t110);
    let t113 = circuit_add(t109, t112);
    let t114 = circuit_mul(t110, in57);
    let t115 = circuit_mul(t33, t114);
    let t116 = circuit_mul(in21, t114);
    let t117 = circuit_add(t113, t116);
    let t118 = circuit_mul(t114, in57);
    let t119 = circuit_mul(t33, t118);
    let t120 = circuit_mul(in22, t118);
    let t121 = circuit_add(t117, t120);
    let t122 = circuit_mul(t118, in57);
    let t123 = circuit_mul(t33, t122);
    let t124 = circuit_mul(in23, t122);
    let t125 = circuit_add(t121, t124);
    let t126 = circuit_mul(t122, in57);
    let t127 = circuit_mul(t33, t126);
    let t128 = circuit_mul(in24, t126);
    let t129 = circuit_add(t125, t128);
    let t130 = circuit_mul(t126, in57);
    let t131 = circuit_mul(t33, t130);
    let t132 = circuit_mul(in25, t130);
    let t133 = circuit_add(t129, t132);
    let t134 = circuit_mul(t130, in57);
    let t135 = circuit_mul(t33, t134);
    let t136 = circuit_mul(in26, t134);
    let t137 = circuit_add(t133, t136);
    let t138 = circuit_mul(t134, in57);
    let t139 = circuit_mul(t33, t138);
    let t140 = circuit_mul(in27, t138);
    let t141 = circuit_add(t137, t140);
    let t142 = circuit_mul(t138, in57);
    let t143 = circuit_mul(t33, t142);
    let t144 = circuit_mul(in28, t142);
    let t145 = circuit_add(t141, t144);
    let t146 = circuit_mul(t142, in57);
    let t147 = circuit_mul(t33, t146);
    let t148 = circuit_mul(in29, t146);
    let t149 = circuit_add(t145, t148);
    let t150 = circuit_mul(t146, in57);
    let t151 = circuit_mul(t33, t150);
    let t152 = circuit_mul(in30, t150);
    let t153 = circuit_add(t149, t152);
    let t154 = circuit_mul(t150, in57);
    let t155 = circuit_mul(t33, t154);
    let t156 = circuit_mul(in31, t154);
    let t157 = circuit_add(t153, t156);
    let t158 = circuit_mul(t154, in57);
    let t159 = circuit_mul(t33, t158);
    let t160 = circuit_mul(in32, t158);
    let t161 = circuit_add(t157, t160);
    let t162 = circuit_mul(t158, in57);
    let t163 = circuit_mul(t33, t162);
    let t164 = circuit_mul(in33, t162);
    let t165 = circuit_add(t161, t164);
    let t166 = circuit_mul(t162, in57);
    let t167 = circuit_mul(t33, t166);
    let t168 = circuit_mul(in34, t166);
    let t169 = circuit_add(t165, t168);
    let t170 = circuit_mul(t166, in57);
    let t171 = circuit_mul(t33, t170);
    let t172 = circuit_mul(in35, t170);
    let t173 = circuit_add(t169, t172);
    let t174 = circuit_mul(t170, in57);
    let t175 = circuit_mul(t33, t174);
    let t176 = circuit_mul(in36, t174);
    let t177 = circuit_add(t173, t176);
    let t178 = circuit_mul(t174, in57);
    let t179 = circuit_mul(t38, t178);
    let t180 = circuit_mul(in37, t178);
    let t181 = circuit_add(t177, t180);
    let t182 = circuit_mul(t178, in57);
    let t183 = circuit_mul(t38, t182);
    let t184 = circuit_mul(in38, t182);
    let t185 = circuit_add(t181, t184);
    let t186 = circuit_mul(t182, in57);
    let t187 = circuit_mul(t38, t186);
    let t188 = circuit_mul(in39, t186);
    let t189 = circuit_add(t185, t188);
    let t190 = circuit_mul(t186, in57);
    let t191 = circuit_mul(t38, t190);
    let t192 = circuit_mul(in40, t190);
    let t193 = circuit_add(t189, t192);
    let t194 = circuit_mul(t190, in57);
    let t195 = circuit_mul(t38, t194);
    let t196 = circuit_mul(in41, t194);
    let t197 = circuit_add(t193, t196);
    let t198 = circuit_mul(t194, in57);
    let t199 = circuit_mul(t38, t198);
    let t200 = circuit_mul(in42, t198);
    let t201 = circuit_add(t197, t200);
    let t202 = circuit_mul(t198, in57);
    let t203 = circuit_mul(t38, t202);
    let t204 = circuit_mul(in43, t202);
    let t205 = circuit_add(t201, t204);
    let t206 = circuit_mul(t202, in57);
    let t207 = circuit_mul(t38, t206);
    let t208 = circuit_mul(in44, t206);
    let t209 = circuit_add(t205, t208);
    let t210 = circuit_mul(t206, in57);
    let t211 = circuit_mul(t38, t210);
    let t212 = circuit_mul(in45, t210);
    let t213 = circuit_add(t209, t212);
    let t214 = circuit_mul(in59, in59);
    let t215 = circuit_mul(t214, t14);
    let t216 = circuit_sub(in0, t215);
    let t217 = circuit_mul(t215, in47);
    let t218 = circuit_add(in0, t217);
    let t219 = circuit_mul(t214, in59);
    let t220 = circuit_mul(t219, t16);
    let t221 = circuit_sub(in0, t220);
    let t222 = circuit_mul(t220, in48);
    let t223 = circuit_add(t218, t222);
    let t224 = circuit_mul(t219, in59);
    let t225 = circuit_mul(t224, t18);
    let t226 = circuit_sub(in0, t225);
    let t227 = circuit_mul(t225, in49);
    let t228 = circuit_add(t223, t227);
    let t229 = circuit_mul(t224, in59);
    let t230 = circuit_mul(t229, t20);
    let t231 = circuit_sub(in0, t230);
    let t232 = circuit_mul(t230, in50);
    let t233 = circuit_add(t228, t232);
    let t234 = circuit_mul(t229, in59);
    let t235 = circuit_mul(t234, t22);
    let t236 = circuit_sub(in0, t235);
    let t237 = circuit_mul(t235, in51);
    let t238 = circuit_add(t233, t237);
    let t239 = circuit_mul(t234, in59);
    let t240 = circuit_mul(t239, t24);
    let t241 = circuit_sub(in0, t240);
    let t242 = circuit_mul(t240, in52);
    let t243 = circuit_add(t238, t242);
    let t244 = circuit_mul(t239, in59);
    let t245 = circuit_mul(t244, t26);
    let t246 = circuit_sub(in0, t245);
    let t247 = circuit_mul(t245, in53);
    let t248 = circuit_add(t243, t247);
    let t249 = circuit_mul(t244, in59);
    let t250 = circuit_mul(t249, t28);
    let t251 = circuit_sub(in0, t250);
    let t252 = circuit_mul(t250, in54);
    let t253 = circuit_add(t248, t252);
    let t254 = circuit_mul(t249, in59);
    let t255 = circuit_mul(t254, t30);
    let t256 = circuit_sub(in0, t255);
    let t257 = circuit_mul(t255, in55);
    let t258 = circuit_add(t253, t257);
    let t259 = circuit_sub(in1, in69);
    let t260 = circuit_mul(t8, t259);
    let t261 = circuit_mul(t8, t213);
    let t262 = circuit_add(t261, t261);
    let t263 = circuit_sub(t260, in69);
    let t264 = circuit_mul(in55, t263);
    let t265 = circuit_sub(t262, t264);
    let t266 = circuit_add(t260, in69);
    let t267 = circuit_inverse(t266);
    let t268 = circuit_mul(t265, t267);
    let t269 = circuit_sub(in1, in68);
    let t270 = circuit_mul(t7, t269);
    let t271 = circuit_mul(t7, t268);
    let t272 = circuit_add(t271, t271);
    let t273 = circuit_sub(t270, in68);
    let t274 = circuit_mul(in54, t273);
    let t275 = circuit_sub(t272, t274);
    let t276 = circuit_add(t270, in68);
    let t277 = circuit_inverse(t276);
    let t278 = circuit_mul(t275, t277);
    let t279 = circuit_sub(in1, in67);
    let t280 = circuit_mul(t6, t279);
    let t281 = circuit_mul(t6, t278);
    let t282 = circuit_add(t281, t281);
    let t283 = circuit_sub(t280, in67);
    let t284 = circuit_mul(in53, t283);
    let t285 = circuit_sub(t282, t284);
    let t286 = circuit_add(t280, in67);
    let t287 = circuit_inverse(t286);
    let t288 = circuit_mul(t285, t287);
    let t289 = circuit_sub(in1, in66);
    let t290 = circuit_mul(t5, t289);
    let t291 = circuit_mul(t5, t288);
    let t292 = circuit_add(t291, t291);
    let t293 = circuit_sub(t290, in66);
    let t294 = circuit_mul(in52, t293);
    let t295 = circuit_sub(t292, t294);
    let t296 = circuit_add(t290, in66);
    let t297 = circuit_inverse(t296);
    let t298 = circuit_mul(t295, t297);
    let t299 = circuit_sub(in1, in65);
    let t300 = circuit_mul(t4, t299);
    let t301 = circuit_mul(t4, t298);
    let t302 = circuit_add(t301, t301);
    let t303 = circuit_sub(t300, in65);
    let t304 = circuit_mul(in51, t303);
    let t305 = circuit_sub(t302, t304);
    let t306 = circuit_add(t300, in65);
    let t307 = circuit_inverse(t306);
    let t308 = circuit_mul(t305, t307);
    let t309 = circuit_sub(in1, in64);
    let t310 = circuit_mul(t3, t309);
    let t311 = circuit_mul(t3, t308);
    let t312 = circuit_add(t311, t311);
    let t313 = circuit_sub(t310, in64);
    let t314 = circuit_mul(in50, t313);
    let t315 = circuit_sub(t312, t314);
    let t316 = circuit_add(t310, in64);
    let t317 = circuit_inverse(t316);
    let t318 = circuit_mul(t315, t317);
    let t319 = circuit_sub(in1, in63);
    let t320 = circuit_mul(t2, t319);
    let t321 = circuit_mul(t2, t318);
    let t322 = circuit_add(t321, t321);
    let t323 = circuit_sub(t320, in63);
    let t324 = circuit_mul(in49, t323);
    let t325 = circuit_sub(t322, t324);
    let t326 = circuit_add(t320, in63);
    let t327 = circuit_inverse(t326);
    let t328 = circuit_mul(t325, t327);
    let t329 = circuit_sub(in1, in62);
    let t330 = circuit_mul(t1, t329);
    let t331 = circuit_mul(t1, t328);
    let t332 = circuit_add(t331, t331);
    let t333 = circuit_sub(t330, in62);
    let t334 = circuit_mul(in48, t333);
    let t335 = circuit_sub(t332, t334);
    let t336 = circuit_add(t330, in62);
    let t337 = circuit_inverse(t336);
    let t338 = circuit_mul(t335, t337);
    let t339 = circuit_sub(in1, in61);
    let t340 = circuit_mul(t0, t339);
    let t341 = circuit_mul(t0, t338);
    let t342 = circuit_add(t341, t341);
    let t343 = circuit_sub(t340, in61);
    let t344 = circuit_mul(in47, t343);
    let t345 = circuit_sub(t342, t344);
    let t346 = circuit_add(t340, in61);
    let t347 = circuit_inverse(t346);
    let t348 = circuit_mul(t345, t347);
    let t349 = circuit_sub(in1, in60);
    let t350 = circuit_mul(in56, t349);
    let t351 = circuit_mul(in56, t348);
    let t352 = circuit_add(t351, t351);
    let t353 = circuit_sub(t350, in60);
    let t354 = circuit_mul(in46, t353);
    let t355 = circuit_sub(t352, t354);
    let t356 = circuit_add(t350, in60);
    let t357 = circuit_inverse(t356);
    let t358 = circuit_mul(t355, t357);
    let t359 = circuit_mul(t358, t10);
    let t360 = circuit_add(t258, t359);
    let t361 = circuit_mul(in46, in59);
    let t362 = circuit_mul(t361, t12);
    let t363 = circuit_add(t360, t362);
    let t364 = circuit_add(t123, t179);
    let t365 = circuit_add(t127, t183);
    let t366 = circuit_add(t131, t187);
    let t367 = circuit_add(t135, t191);
    let t368 = circuit_add(t147, t195);
    let t369 = circuit_add(t151, t199);
    let t370 = circuit_add(t155, t203);
    let t371 = circuit_add(t159, t207);
    let t372 = circuit_add(t39, t43);
    let t373 = circuit_add(t372, t47);
    let t374 = circuit_add(t373, t51);
    let t375 = circuit_add(t374, t55);
    let t376 = circuit_add(t375, t59);
    let t377 = circuit_add(t376, t63);
    let t378 = circuit_add(t377, t67);
    let t379 = circuit_add(t378, t71);
    let t380 = circuit_add(t379, t75);
    let t381 = circuit_add(t380, t79);
    let t382 = circuit_add(t381, t83);
    let t383 = circuit_add(t382, t87);
    let t384 = circuit_add(t383, t91);
    let t385 = circuit_add(t384, t95);
    let t386 = circuit_add(t385, t99);
    let t387 = circuit_add(t386, t103);
    let t388 = circuit_add(t387, t107);
    let t389 = circuit_add(t388, t111);
    let t390 = circuit_add(t389, t115);
    let t391 = circuit_add(t390, t119);
    let t392 = circuit_add(t391, t364);
    let t393 = circuit_add(t392, t365);
    let t394 = circuit_add(t393, t366);
    let t395 = circuit_add(t394, t367);
    let t396 = circuit_add(t395, t139);
    let t397 = circuit_add(t396, t143);
    let t398 = circuit_add(t397, t368);
    let t399 = circuit_add(t398, t369);
    let t400 = circuit_add(t399, t370);
    let t401 = circuit_add(t400, t371);
    let t402 = circuit_add(t401, t163);
    let t403 = circuit_add(t402, t167);
    let t404 = circuit_add(t403, t171);
    let t405 = circuit_add(t404, t175);
    let t406 = circuit_add(t405, t211);
    let t407 = circuit_add(t406, t216);
    let t408 = circuit_add(t407, t221);
    let t409 = circuit_add(t408, t226);
    let t410 = circuit_add(t409, t231);
    let t411 = circuit_add(t410, t236);
    let t412 = circuit_add(t411, t241);
    let t413 = circuit_add(t412, t246);
    let t414 = circuit_add(t413, t251);
    let t415 = circuit_add(t414, t256);
    let t416 = circuit_add(t415, t363);

    let modulus = get_GRUMPKIN_modulus(); // GRUMPKIN prime field modulus

    let mut circuit_inputs = (t416,).new_inputs();
    // Prefill constants:
    circuit_inputs = circuit_inputs.next_2([0x0, 0x0, 0x0, 0x0]); // in0
    circuit_inputs = circuit_inputs.next_2([0x1, 0x0, 0x0, 0x0]); // in1
    // Fill inputs:

    let mut p_sumcheck_evaluations = p_sumcheck_evaluations;
    while let Option::Some(val) = p_sumcheck_evaluations.pop_front() {
        circuit_inputs = circuit_inputs.next_u256(*val);
    }; // in2 - in45

    let mut p_gemini_a_evaluations = p_gemini_a_evaluations;
    while let Option::Some(val) = p_gemini_a_evaluations.pop_front() {
        circuit_inputs = circuit_inputs.next_u256(*val);
    }; // in46 - in55

    circuit_inputs = circuit_inputs.next_2(tp_gemini_r); // in56
    circuit_inputs = circuit_inputs.next_2(tp_rho); // in57
    circuit_inputs = circuit_inputs.next_2(tp_shplonk_z); // in58
    circuit_inputs = circuit_inputs.next_2(tp_shplonk_nu); // in59

    let mut tp_sum_check_u_challenges = tp_sum_check_u_challenges;
    while let Option::Some(val) = tp_sum_check_u_challenges.pop_front() {
        circuit_inputs = circuit_inputs.next_u128(*val);
    }; // in60 - in69

    let outputs = circuit_inputs.done_2().eval(modulus).unwrap();
    let scalar_1: u384 = outputs.get_output(t39);
    let scalar_2: u384 = outputs.get_output(t43);
    let scalar_3: u384 = outputs.get_output(t47);
    let scalar_4: u384 = outputs.get_output(t51);
    let scalar_5: u384 = outputs.get_output(t55);
    let scalar_6: u384 = outputs.get_output(t59);
    let scalar_7: u384 = outputs.get_output(t63);
    let scalar_8: u384 = outputs.get_output(t67);
    let scalar_9: u384 = outputs.get_output(t71);
    let scalar_10: u384 = outputs.get_output(t75);
    let scalar_11: u384 = outputs.get_output(t79);
    let scalar_12: u384 = outputs.get_output(t83);
    let scalar_13: u384 = outputs.get_output(t87);
    let scalar_14: u384 = outputs.get_output(t91);
    let scalar_15: u384 = outputs.get_output(t95);
    let scalar_16: u384 = outputs.get_output(t99);
    let scalar_17: u384 = outputs.get_output(t103);
    let scalar_18: u384 = outputs.get_output(t107);
    let scalar_19: u384 = outputs.get_output(t111);
    let scalar_20: u384 = outputs.get_output(t115);
    let scalar_21: u384 = outputs.get_output(t119);
    let scalar_22: u384 = outputs.get_output(t364);
    let scalar_23: u384 = outputs.get_output(t365);
    let scalar_24: u384 = outputs.get_output(t366);
    let scalar_25: u384 = outputs.get_output(t367);
    let scalar_26: u384 = outputs.get_output(t139);
    let scalar_27: u384 = outputs.get_output(t143);
    let scalar_28: u384 = outputs.get_output(t368);
    let scalar_29: u384 = outputs.get_output(t369);
    let scalar_30: u384 = outputs.get_output(t370);
    let scalar_31: u384 = outputs.get_output(t371);
    let scalar_32: u384 = outputs.get_output(t163);
    let scalar_33: u384 = outputs.get_output(t167);
    let scalar_34: u384 = outputs.get_output(t171);
    let scalar_35: u384 = outputs.get_output(t175);
    let scalar_44: u384 = outputs.get_output(t211);
    let scalar_45: u384 = outputs.get_output(t216);
    let scalar_46: u384 = outputs.get_output(t221);
    let scalar_47: u384 = outputs.get_output(t226);
    let scalar_48: u384 = outputs.get_output(t231);
    let scalar_49: u384 = outputs.get_output(t236);
    let scalar_50: u384 = outputs.get_output(t241);
    let scalar_51: u384 = outputs.get_output(t246);
    let scalar_52: u384 = outputs.get_output(t251);
    let scalar_53: u384 = outputs.get_output(t256);
    let scalar_72: u384 = outputs.get_output(t363);
    let sum_scalars: u384 = outputs.get_output(t416);
    return (
        scalar_1,
        scalar_2,
        scalar_3,
        scalar_4,
        scalar_5,
        scalar_6,
        scalar_7,
        scalar_8,
        scalar_9,
        scalar_10,
        scalar_11,
        scalar_12,
        scalar_13,
        scalar_14,
        scalar_15,
        scalar_16,
        scalar_17,
        scalar_18,
        scalar_19,
        scalar_20,
        scalar_21,
        scalar_22,
        scalar_23,
        scalar_24,
        scalar_25,
        scalar_26,
        scalar_27,
        scalar_28,
        scalar_29,
        scalar_30,
        scalar_31,
        scalar_32,
        scalar_33,
        scalar_34,
        scalar_35,
        scalar_44,
        scalar_45,
        scalar_46,
        scalar_47,
        scalar_48,
        scalar_49,
        scalar_50,
        scalar_51,
        scalar_52,
        scalar_53,
        scalar_72,
        sum_scalars,
    );
}
#[inline(always)]
pub fn run_BN254_EVAL_FN_CHALLENGE_DUPL_47P_RLC_circuit(
    A0: G1Point, A2: G1Point, coeff0: u384, coeff2: u384, SumDlogDivBatched: FunctionFelt,
) -> (u384,) {
    // INPUT stack
    let (in0, in1, in2) = (CE::<CI<0>> {}, CE::<CI<1>> {}, CE::<CI<2>> {});
    let (in3, in4, in5) = (CE::<CI<3>> {}, CE::<CI<4>> {}, CE::<CI<5>> {});
    let (in6, in7, in8) = (CE::<CI<6>> {}, CE::<CI<7>> {}, CE::<CI<8>> {});
    let (in9, in10, in11) = (CE::<CI<9>> {}, CE::<CI<10>> {}, CE::<CI<11>> {});
    let (in12, in13, in14) = (CE::<CI<12>> {}, CE::<CI<13>> {}, CE::<CI<14>> {});
    let (in15, in16, in17) = (CE::<CI<15>> {}, CE::<CI<16>> {}, CE::<CI<17>> {});
    let (in18, in19, in20) = (CE::<CI<18>> {}, CE::<CI<19>> {}, CE::<CI<20>> {});
    let (in21, in22, in23) = (CE::<CI<21>> {}, CE::<CI<22>> {}, CE::<CI<23>> {});
    let (in24, in25, in26) = (CE::<CI<24>> {}, CE::<CI<25>> {}, CE::<CI<26>> {});
    let (in27, in28, in29) = (CE::<CI<27>> {}, CE::<CI<28>> {}, CE::<CI<29>> {});
    let (in30, in31, in32) = (CE::<CI<30>> {}, CE::<CI<31>> {}, CE::<CI<32>> {});
    let (in33, in34, in35) = (CE::<CI<33>> {}, CE::<CI<34>> {}, CE::<CI<35>> {});
    let (in36, in37, in38) = (CE::<CI<36>> {}, CE::<CI<37>> {}, CE::<CI<38>> {});
    let (in39, in40, in41) = (CE::<CI<39>> {}, CE::<CI<40>> {}, CE::<CI<41>> {});
    let (in42, in43, in44) = (CE::<CI<42>> {}, CE::<CI<43>> {}, CE::<CI<44>> {});
    let (in45, in46, in47) = (CE::<CI<45>> {}, CE::<CI<46>> {}, CE::<CI<47>> {});
    let (in48, in49, in50) = (CE::<CI<48>> {}, CE::<CI<49>> {}, CE::<CI<50>> {});
    let (in51, in52, in53) = (CE::<CI<51>> {}, CE::<CI<52>> {}, CE::<CI<53>> {});
    let (in54, in55, in56) = (CE::<CI<54>> {}, CE::<CI<55>> {}, CE::<CI<56>> {});
    let (in57, in58, in59) = (CE::<CI<57>> {}, CE::<CI<58>> {}, CE::<CI<59>> {});
    let (in60, in61, in62) = (CE::<CI<60>> {}, CE::<CI<61>> {}, CE::<CI<62>> {});
    let (in63, in64, in65) = (CE::<CI<63>> {}, CE::<CI<64>> {}, CE::<CI<65>> {});
    let (in66, in67, in68) = (CE::<CI<66>> {}, CE::<CI<67>> {}, CE::<CI<68>> {});
    let (in69, in70, in71) = (CE::<CI<69>> {}, CE::<CI<70>> {}, CE::<CI<71>> {});
    let (in72, in73, in74) = (CE::<CI<72>> {}, CE::<CI<73>> {}, CE::<CI<74>> {});
    let (in75, in76, in77) = (CE::<CI<75>> {}, CE::<CI<76>> {}, CE::<CI<77>> {});
    let (in78, in79, in80) = (CE::<CI<78>> {}, CE::<CI<79>> {}, CE::<CI<80>> {});
    let (in81, in82, in83) = (CE::<CI<81>> {}, CE::<CI<82>> {}, CE::<CI<83>> {});
    let (in84, in85, in86) = (CE::<CI<84>> {}, CE::<CI<85>> {}, CE::<CI<86>> {});
    let (in87, in88, in89) = (CE::<CI<87>> {}, CE::<CI<88>> {}, CE::<CI<89>> {});
    let (in90, in91, in92) = (CE::<CI<90>> {}, CE::<CI<91>> {}, CE::<CI<92>> {});
    let (in93, in94, in95) = (CE::<CI<93>> {}, CE::<CI<94>> {}, CE::<CI<95>> {});
    let (in96, in97, in98) = (CE::<CI<96>> {}, CE::<CI<97>> {}, CE::<CI<98>> {});
    let (in99, in100, in101) = (CE::<CI<99>> {}, CE::<CI<100>> {}, CE::<CI<101>> {});
    let (in102, in103, in104) = (CE::<CI<102>> {}, CE::<CI<103>> {}, CE::<CI<104>> {});
    let (in105, in106, in107) = (CE::<CI<105>> {}, CE::<CI<106>> {}, CE::<CI<107>> {});
    let (in108, in109, in110) = (CE::<CI<108>> {}, CE::<CI<109>> {}, CE::<CI<110>> {});
    let (in111, in112, in113) = (CE::<CI<111>> {}, CE::<CI<112>> {}, CE::<CI<113>> {});
    let (in114, in115, in116) = (CE::<CI<114>> {}, CE::<CI<115>> {}, CE::<CI<116>> {});
    let (in117, in118, in119) = (CE::<CI<117>> {}, CE::<CI<118>> {}, CE::<CI<119>> {});
    let (in120, in121, in122) = (CE::<CI<120>> {}, CE::<CI<121>> {}, CE::<CI<122>> {});
    let (in123, in124, in125) = (CE::<CI<123>> {}, CE::<CI<124>> {}, CE::<CI<125>> {});
    let (in126, in127, in128) = (CE::<CI<126>> {}, CE::<CI<127>> {}, CE::<CI<128>> {});
    let (in129, in130, in131) = (CE::<CI<129>> {}, CE::<CI<130>> {}, CE::<CI<131>> {});
    let (in132, in133, in134) = (CE::<CI<132>> {}, CE::<CI<133>> {}, CE::<CI<134>> {});
    let (in135, in136, in137) = (CE::<CI<135>> {}, CE::<CI<136>> {}, CE::<CI<137>> {});
    let (in138, in139, in140) = (CE::<CI<138>> {}, CE::<CI<139>> {}, CE::<CI<140>> {});
    let (in141, in142, in143) = (CE::<CI<141>> {}, CE::<CI<142>> {}, CE::<CI<143>> {});
    let (in144, in145, in146) = (CE::<CI<144>> {}, CE::<CI<145>> {}, CE::<CI<146>> {});
    let (in147, in148, in149) = (CE::<CI<147>> {}, CE::<CI<148>> {}, CE::<CI<149>> {});
    let (in150, in151, in152) = (CE::<CI<150>> {}, CE::<CI<151>> {}, CE::<CI<152>> {});
    let (in153, in154, in155) = (CE::<CI<153>> {}, CE::<CI<154>> {}, CE::<CI<155>> {});
    let (in156, in157, in158) = (CE::<CI<156>> {}, CE::<CI<157>> {}, CE::<CI<158>> {});
    let (in159, in160, in161) = (CE::<CI<159>> {}, CE::<CI<160>> {}, CE::<CI<161>> {});
    let (in162, in163, in164) = (CE::<CI<162>> {}, CE::<CI<163>> {}, CE::<CI<164>> {});
    let (in165, in166, in167) = (CE::<CI<165>> {}, CE::<CI<166>> {}, CE::<CI<167>> {});
    let (in168, in169, in170) = (CE::<CI<168>> {}, CE::<CI<169>> {}, CE::<CI<170>> {});
    let (in171, in172, in173) = (CE::<CI<171>> {}, CE::<CI<172>> {}, CE::<CI<173>> {});
    let (in174, in175, in176) = (CE::<CI<174>> {}, CE::<CI<175>> {}, CE::<CI<176>> {});
    let (in177, in178, in179) = (CE::<CI<177>> {}, CE::<CI<178>> {}, CE::<CI<179>> {});
    let (in180, in181, in182) = (CE::<CI<180>> {}, CE::<CI<181>> {}, CE::<CI<182>> {});
    let (in183, in184, in185) = (CE::<CI<183>> {}, CE::<CI<184>> {}, CE::<CI<185>> {});
    let (in186, in187, in188) = (CE::<CI<186>> {}, CE::<CI<187>> {}, CE::<CI<188>> {});
    let (in189, in190, in191) = (CE::<CI<189>> {}, CE::<CI<190>> {}, CE::<CI<191>> {});
    let (in192, in193, in194) = (CE::<CI<192>> {}, CE::<CI<193>> {}, CE::<CI<194>> {});
    let (in195, in196, in197) = (CE::<CI<195>> {}, CE::<CI<196>> {}, CE::<CI<197>> {});
    let (in198, in199, in200) = (CE::<CI<198>> {}, CE::<CI<199>> {}, CE::<CI<200>> {});
    let (in201, in202, in203) = (CE::<CI<201>> {}, CE::<CI<202>> {}, CE::<CI<203>> {});
    let (in204, in205, in206) = (CE::<CI<204>> {}, CE::<CI<205>> {}, CE::<CI<206>> {});
    let (in207, in208, in209) = (CE::<CI<207>> {}, CE::<CI<208>> {}, CE::<CI<209>> {});
    let (in210, in211) = (CE::<CI<210>> {}, CE::<CI<211>> {});
    let t0 = circuit_mul(in55, in0); // Eval sumdlogdiv_a_num Horner step: multiply by xA0
    let t1 = circuit_add(in54, t0); // Eval sumdlogdiv_a_num Horner step: add coefficient_48
    let t2 = circuit_mul(t1, in0); // Eval sumdlogdiv_a_num Horner step: multiply by xA0
    let t3 = circuit_add(in53, t2); // Eval sumdlogdiv_a_num Horner step: add coefficient_47
    let t4 = circuit_mul(t3, in0); // Eval sumdlogdiv_a_num Horner step: multiply by xA0
    let t5 = circuit_add(in52, t4); // Eval sumdlogdiv_a_num Horner step: add coefficient_46
    let t6 = circuit_mul(t5, in0); // Eval sumdlogdiv_a_num Horner step: multiply by xA0
    let t7 = circuit_add(in51, t6); // Eval sumdlogdiv_a_num Horner step: add coefficient_45
    let t8 = circuit_mul(t7, in0); // Eval sumdlogdiv_a_num Horner step: multiply by xA0
    let t9 = circuit_add(in50, t8); // Eval sumdlogdiv_a_num Horner step: add coefficient_44
    let t10 = circuit_mul(t9, in0); // Eval sumdlogdiv_a_num Horner step: multiply by xA0
    let t11 = circuit_add(in49, t10); // Eval sumdlogdiv_a_num Horner step: add coefficient_43
    let t12 = circuit_mul(t11, in0); // Eval sumdlogdiv_a_num Horner step: multiply by xA0
    let t13 = circuit_add(in48, t12); // Eval sumdlogdiv_a_num Horner step: add coefficient_42
    let t14 = circuit_mul(t13, in0); // Eval sumdlogdiv_a_num Horner step: multiply by xA0
    let t15 = circuit_add(in47, t14); // Eval sumdlogdiv_a_num Horner step: add coefficient_41
    let t16 = circuit_mul(t15, in0); // Eval sumdlogdiv_a_num Horner step: multiply by xA0
    let t17 = circuit_add(in46, t16); // Eval sumdlogdiv_a_num Horner step: add coefficient_40
    let t18 = circuit_mul(t17, in0); // Eval sumdlogdiv_a_num Horner step: multiply by xA0
    let t19 = circuit_add(in45, t18); // Eval sumdlogdiv_a_num Horner step: add coefficient_39
    let t20 = circuit_mul(t19, in0); // Eval sumdlogdiv_a_num Horner step: multiply by xA0
    let t21 = circuit_add(in44, t20); // Eval sumdlogdiv_a_num Horner step: add coefficient_38
    let t22 = circuit_mul(t21, in0); // Eval sumdlogdiv_a_num Horner step: multiply by xA0
    let t23 = circuit_add(in43, t22); // Eval sumdlogdiv_a_num Horner step: add coefficient_37
    let t24 = circuit_mul(t23, in0); // Eval sumdlogdiv_a_num Horner step: multiply by xA0
    let t25 = circuit_add(in42, t24); // Eval sumdlogdiv_a_num Horner step: add coefficient_36
    let t26 = circuit_mul(t25, in0); // Eval sumdlogdiv_a_num Horner step: multiply by xA0
    let t27 = circuit_add(in41, t26); // Eval sumdlogdiv_a_num Horner step: add coefficient_35
    let t28 = circuit_mul(t27, in0); // Eval sumdlogdiv_a_num Horner step: multiply by xA0
    let t29 = circuit_add(in40, t28); // Eval sumdlogdiv_a_num Horner step: add coefficient_34
    let t30 = circuit_mul(t29, in0); // Eval sumdlogdiv_a_num Horner step: multiply by xA0
    let t31 = circuit_add(in39, t30); // Eval sumdlogdiv_a_num Horner step: add coefficient_33
    let t32 = circuit_mul(t31, in0); // Eval sumdlogdiv_a_num Horner step: multiply by xA0
    let t33 = circuit_add(in38, t32); // Eval sumdlogdiv_a_num Horner step: add coefficient_32
    let t34 = circuit_mul(t33, in0); // Eval sumdlogdiv_a_num Horner step: multiply by xA0
    let t35 = circuit_add(in37, t34); // Eval sumdlogdiv_a_num Horner step: add coefficient_31
    let t36 = circuit_mul(t35, in0); // Eval sumdlogdiv_a_num Horner step: multiply by xA0
    let t37 = circuit_add(in36, t36); // Eval sumdlogdiv_a_num Horner step: add coefficient_30
    let t38 = circuit_mul(t37, in0); // Eval sumdlogdiv_a_num Horner step: multiply by xA0
    let t39 = circuit_add(in35, t38); // Eval sumdlogdiv_a_num Horner step: add coefficient_29
    let t40 = circuit_mul(t39, in0); // Eval sumdlogdiv_a_num Horner step: multiply by xA0
    let t41 = circuit_add(in34, t40); // Eval sumdlogdiv_a_num Horner step: add coefficient_28
    let t42 = circuit_mul(t41, in0); // Eval sumdlogdiv_a_num Horner step: multiply by xA0
    let t43 = circuit_add(in33, t42); // Eval sumdlogdiv_a_num Horner step: add coefficient_27
    let t44 = circuit_mul(t43, in0); // Eval sumdlogdiv_a_num Horner step: multiply by xA0
    let t45 = circuit_add(in32, t44); // Eval sumdlogdiv_a_num Horner step: add coefficient_26
    let t46 = circuit_mul(t45, in0); // Eval sumdlogdiv_a_num Horner step: multiply by xA0
    let t47 = circuit_add(in31, t46); // Eval sumdlogdiv_a_num Horner step: add coefficient_25
    let t48 = circuit_mul(t47, in0); // Eval sumdlogdiv_a_num Horner step: multiply by xA0
    let t49 = circuit_add(in30, t48); // Eval sumdlogdiv_a_num Horner step: add coefficient_24
    let t50 = circuit_mul(t49, in0); // Eval sumdlogdiv_a_num Horner step: multiply by xA0
    let t51 = circuit_add(in29, t50); // Eval sumdlogdiv_a_num Horner step: add coefficient_23
    let t52 = circuit_mul(t51, in0); // Eval sumdlogdiv_a_num Horner step: multiply by xA0
    let t53 = circuit_add(in28, t52); // Eval sumdlogdiv_a_num Horner step: add coefficient_22
    let t54 = circuit_mul(t53, in0); // Eval sumdlogdiv_a_num Horner step: multiply by xA0
    let t55 = circuit_add(in27, t54); // Eval sumdlogdiv_a_num Horner step: add coefficient_21
    let t56 = circuit_mul(t55, in0); // Eval sumdlogdiv_a_num Horner step: multiply by xA0
    let t57 = circuit_add(in26, t56); // Eval sumdlogdiv_a_num Horner step: add coefficient_20
    let t58 = circuit_mul(t57, in0); // Eval sumdlogdiv_a_num Horner step: multiply by xA0
    let t59 = circuit_add(in25, t58); // Eval sumdlogdiv_a_num Horner step: add coefficient_19
    let t60 = circuit_mul(t59, in0); // Eval sumdlogdiv_a_num Horner step: multiply by xA0
    let t61 = circuit_add(in24, t60); // Eval sumdlogdiv_a_num Horner step: add coefficient_18
    let t62 = circuit_mul(t61, in0); // Eval sumdlogdiv_a_num Horner step: multiply by xA0
    let t63 = circuit_add(in23, t62); // Eval sumdlogdiv_a_num Horner step: add coefficient_17
    let t64 = circuit_mul(t63, in0); // Eval sumdlogdiv_a_num Horner step: multiply by xA0
    let t65 = circuit_add(in22, t64); // Eval sumdlogdiv_a_num Horner step: add coefficient_16
    let t66 = circuit_mul(t65, in0); // Eval sumdlogdiv_a_num Horner step: multiply by xA0
    let t67 = circuit_add(in21, t66); // Eval sumdlogdiv_a_num Horner step: add coefficient_15
    let t68 = circuit_mul(t67, in0); // Eval sumdlogdiv_a_num Horner step: multiply by xA0
    let t69 = circuit_add(in20, t68); // Eval sumdlogdiv_a_num Horner step: add coefficient_14
    let t70 = circuit_mul(t69, in0); // Eval sumdlogdiv_a_num Horner step: multiply by xA0
    let t71 = circuit_add(in19, t70); // Eval sumdlogdiv_a_num Horner step: add coefficient_13
    let t72 = circuit_mul(t71, in0); // Eval sumdlogdiv_a_num Horner step: multiply by xA0
    let t73 = circuit_add(in18, t72); // Eval sumdlogdiv_a_num Horner step: add coefficient_12
    let t74 = circuit_mul(t73, in0); // Eval sumdlogdiv_a_num Horner step: multiply by xA0
    let t75 = circuit_add(in17, t74); // Eval sumdlogdiv_a_num Horner step: add coefficient_11
    let t76 = circuit_mul(t75, in0); // Eval sumdlogdiv_a_num Horner step: multiply by xA0
    let t77 = circuit_add(in16, t76); // Eval sumdlogdiv_a_num Horner step: add coefficient_10
    let t78 = circuit_mul(t77, in0); // Eval sumdlogdiv_a_num Horner step: multiply by xA0
    let t79 = circuit_add(in15, t78); // Eval sumdlogdiv_a_num Horner step: add coefficient_9
    let t80 = circuit_mul(t79, in0); // Eval sumdlogdiv_a_num Horner step: multiply by xA0
    let t81 = circuit_add(in14, t80); // Eval sumdlogdiv_a_num Horner step: add coefficient_8
    let t82 = circuit_mul(t81, in0); // Eval sumdlogdiv_a_num Horner step: multiply by xA0
    let t83 = circuit_add(in13, t82); // Eval sumdlogdiv_a_num Horner step: add coefficient_7
    let t84 = circuit_mul(t83, in0); // Eval sumdlogdiv_a_num Horner step: multiply by xA0
    let t85 = circuit_add(in12, t84); // Eval sumdlogdiv_a_num Horner step: add coefficient_6
    let t86 = circuit_mul(t85, in0); // Eval sumdlogdiv_a_num Horner step: multiply by xA0
    let t87 = circuit_add(in11, t86); // Eval sumdlogdiv_a_num Horner step: add coefficient_5
    let t88 = circuit_mul(t87, in0); // Eval sumdlogdiv_a_num Horner step: multiply by xA0
    let t89 = circuit_add(in10, t88); // Eval sumdlogdiv_a_num Horner step: add coefficient_4
    let t90 = circuit_mul(t89, in0); // Eval sumdlogdiv_a_num Horner step: multiply by xA0
    let t91 = circuit_add(in9, t90); // Eval sumdlogdiv_a_num Horner step: add coefficient_3
    let t92 = circuit_mul(t91, in0); // Eval sumdlogdiv_a_num Horner step: multiply by xA0
    let t93 = circuit_add(in8, t92); // Eval sumdlogdiv_a_num Horner step: add coefficient_2
    let t94 = circuit_mul(t93, in0); // Eval sumdlogdiv_a_num Horner step: multiply by xA0
    let t95 = circuit_add(in7, t94); // Eval sumdlogdiv_a_num Horner step: add coefficient_1
    let t96 = circuit_mul(t95, in0); // Eval sumdlogdiv_a_num Horner step: multiply by xA0
    let t97 = circuit_add(in6, t96); // Eval sumdlogdiv_a_num Horner step: add coefficient_0
    let t98 = circuit_mul(in106, in0); // Eval sumdlogdiv_a_den Horner step: multiply by xA0
    let t99 = circuit_add(in105, t98); // Eval sumdlogdiv_a_den Horner step: add coefficient_49
    let t100 = circuit_mul(t99, in0); // Eval sumdlogdiv_a_den Horner step: multiply by xA0
    let t101 = circuit_add(in104, t100); // Eval sumdlogdiv_a_den Horner step: add coefficient_48
    let t102 = circuit_mul(t101, in0); // Eval sumdlogdiv_a_den Horner step: multiply by xA0
    let t103 = circuit_add(in103, t102); // Eval sumdlogdiv_a_den Horner step: add coefficient_47
    let t104 = circuit_mul(t103, in0); // Eval sumdlogdiv_a_den Horner step: multiply by xA0
    let t105 = circuit_add(in102, t104); // Eval sumdlogdiv_a_den Horner step: add coefficient_46
    let t106 = circuit_mul(t105, in0); // Eval sumdlogdiv_a_den Horner step: multiply by xA0
    let t107 = circuit_add(in101, t106); // Eval sumdlogdiv_a_den Horner step: add coefficient_45
    let t108 = circuit_mul(t107, in0); // Eval sumdlogdiv_a_den Horner step: multiply by xA0
    let t109 = circuit_add(in100, t108); // Eval sumdlogdiv_a_den Horner step: add coefficient_44
    let t110 = circuit_mul(t109, in0); // Eval sumdlogdiv_a_den Horner step: multiply by xA0
    let t111 = circuit_add(in99, t110); // Eval sumdlogdiv_a_den Horner step: add coefficient_43
    let t112 = circuit_mul(t111, in0); // Eval sumdlogdiv_a_den Horner step: multiply by xA0
    let t113 = circuit_add(in98, t112); // Eval sumdlogdiv_a_den Horner step: add coefficient_42
    let t114 = circuit_mul(t113, in0); // Eval sumdlogdiv_a_den Horner step: multiply by xA0
    let t115 = circuit_add(in97, t114); // Eval sumdlogdiv_a_den Horner step: add coefficient_41
    let t116 = circuit_mul(t115, in0); // Eval sumdlogdiv_a_den Horner step: multiply by xA0
    let t117 = circuit_add(in96, t116); // Eval sumdlogdiv_a_den Horner step: add coefficient_40
    let t118 = circuit_mul(t117, in0); // Eval sumdlogdiv_a_den Horner step: multiply by xA0
    let t119 = circuit_add(in95, t118); // Eval sumdlogdiv_a_den Horner step: add coefficient_39
    let t120 = circuit_mul(t119, in0); // Eval sumdlogdiv_a_den Horner step: multiply by xA0
    let t121 = circuit_add(in94, t120); // Eval sumdlogdiv_a_den Horner step: add coefficient_38
    let t122 = circuit_mul(t121, in0); // Eval sumdlogdiv_a_den Horner step: multiply by xA0
    let t123 = circuit_add(in93, t122); // Eval sumdlogdiv_a_den Horner step: add coefficient_37
    let t124 = circuit_mul(t123, in0); // Eval sumdlogdiv_a_den Horner step: multiply by xA0
    let t125 = circuit_add(in92, t124); // Eval sumdlogdiv_a_den Horner step: add coefficient_36
    let t126 = circuit_mul(t125, in0); // Eval sumdlogdiv_a_den Horner step: multiply by xA0
    let t127 = circuit_add(in91, t126); // Eval sumdlogdiv_a_den Horner step: add coefficient_35
    let t128 = circuit_mul(t127, in0); // Eval sumdlogdiv_a_den Horner step: multiply by xA0
    let t129 = circuit_add(in90, t128); // Eval sumdlogdiv_a_den Horner step: add coefficient_34
    let t130 = circuit_mul(t129, in0); // Eval sumdlogdiv_a_den Horner step: multiply by xA0
    let t131 = circuit_add(in89, t130); // Eval sumdlogdiv_a_den Horner step: add coefficient_33
    let t132 = circuit_mul(t131, in0); // Eval sumdlogdiv_a_den Horner step: multiply by xA0
    let t133 = circuit_add(in88, t132); // Eval sumdlogdiv_a_den Horner step: add coefficient_32
    let t134 = circuit_mul(t133, in0); // Eval sumdlogdiv_a_den Horner step: multiply by xA0
    let t135 = circuit_add(in87, t134); // Eval sumdlogdiv_a_den Horner step: add coefficient_31
    let t136 = circuit_mul(t135, in0); // Eval sumdlogdiv_a_den Horner step: multiply by xA0
    let t137 = circuit_add(in86, t136); // Eval sumdlogdiv_a_den Horner step: add coefficient_30
    let t138 = circuit_mul(t137, in0); // Eval sumdlogdiv_a_den Horner step: multiply by xA0
    let t139 = circuit_add(in85, t138); // Eval sumdlogdiv_a_den Horner step: add coefficient_29
    let t140 = circuit_mul(t139, in0); // Eval sumdlogdiv_a_den Horner step: multiply by xA0
    let t141 = circuit_add(in84, t140); // Eval sumdlogdiv_a_den Horner step: add coefficient_28
    let t142 = circuit_mul(t141, in0); // Eval sumdlogdiv_a_den Horner step: multiply by xA0
    let t143 = circuit_add(in83, t142); // Eval sumdlogdiv_a_den Horner step: add coefficient_27
    let t144 = circuit_mul(t143, in0); // Eval sumdlogdiv_a_den Horner step: multiply by xA0
    let t145 = circuit_add(in82, t144); // Eval sumdlogdiv_a_den Horner step: add coefficient_26
    let t146 = circuit_mul(t145, in0); // Eval sumdlogdiv_a_den Horner step: multiply by xA0
    let t147 = circuit_add(in81, t146); // Eval sumdlogdiv_a_den Horner step: add coefficient_25
    let t148 = circuit_mul(t147, in0); // Eval sumdlogdiv_a_den Horner step: multiply by xA0
    let t149 = circuit_add(in80, t148); // Eval sumdlogdiv_a_den Horner step: add coefficient_24
    let t150 = circuit_mul(t149, in0); // Eval sumdlogdiv_a_den Horner step: multiply by xA0
    let t151 = circuit_add(in79, t150); // Eval sumdlogdiv_a_den Horner step: add coefficient_23
    let t152 = circuit_mul(t151, in0); // Eval sumdlogdiv_a_den Horner step: multiply by xA0
    let t153 = circuit_add(in78, t152); // Eval sumdlogdiv_a_den Horner step: add coefficient_22
    let t154 = circuit_mul(t153, in0); // Eval sumdlogdiv_a_den Horner step: multiply by xA0
    let t155 = circuit_add(in77, t154); // Eval sumdlogdiv_a_den Horner step: add coefficient_21
    let t156 = circuit_mul(t155, in0); // Eval sumdlogdiv_a_den Horner step: multiply by xA0
    let t157 = circuit_add(in76, t156); // Eval sumdlogdiv_a_den Horner step: add coefficient_20
    let t158 = circuit_mul(t157, in0); // Eval sumdlogdiv_a_den Horner step: multiply by xA0
    let t159 = circuit_add(in75, t158); // Eval sumdlogdiv_a_den Horner step: add coefficient_19
    let t160 = circuit_mul(t159, in0); // Eval sumdlogdiv_a_den Horner step: multiply by xA0
    let t161 = circuit_add(in74, t160); // Eval sumdlogdiv_a_den Horner step: add coefficient_18
    let t162 = circuit_mul(t161, in0); // Eval sumdlogdiv_a_den Horner step: multiply by xA0
    let t163 = circuit_add(in73, t162); // Eval sumdlogdiv_a_den Horner step: add coefficient_17
    let t164 = circuit_mul(t163, in0); // Eval sumdlogdiv_a_den Horner step: multiply by xA0
    let t165 = circuit_add(in72, t164); // Eval sumdlogdiv_a_den Horner step: add coefficient_16
    let t166 = circuit_mul(t165, in0); // Eval sumdlogdiv_a_den Horner step: multiply by xA0
    let t167 = circuit_add(in71, t166); // Eval sumdlogdiv_a_den Horner step: add coefficient_15
    let t168 = circuit_mul(t167, in0); // Eval sumdlogdiv_a_den Horner step: multiply by xA0
    let t169 = circuit_add(in70, t168); // Eval sumdlogdiv_a_den Horner step: add coefficient_14
    let t170 = circuit_mul(t169, in0); // Eval sumdlogdiv_a_den Horner step: multiply by xA0
    let t171 = circuit_add(in69, t170); // Eval sumdlogdiv_a_den Horner step: add coefficient_13
    let t172 = circuit_mul(t171, in0); // Eval sumdlogdiv_a_den Horner step: multiply by xA0
    let t173 = circuit_add(in68, t172); // Eval sumdlogdiv_a_den Horner step: add coefficient_12
    let t174 = circuit_mul(t173, in0); // Eval sumdlogdiv_a_den Horner step: multiply by xA0
    let t175 = circuit_add(in67, t174); // Eval sumdlogdiv_a_den Horner step: add coefficient_11
    let t176 = circuit_mul(t175, in0); // Eval sumdlogdiv_a_den Horner step: multiply by xA0
    let t177 = circuit_add(in66, t176); // Eval sumdlogdiv_a_den Horner step: add coefficient_10
    let t178 = circuit_mul(t177, in0); // Eval sumdlogdiv_a_den Horner step: multiply by xA0
    let t179 = circuit_add(in65, t178); // Eval sumdlogdiv_a_den Horner step: add coefficient_9
    let t180 = circuit_mul(t179, in0); // Eval sumdlogdiv_a_den Horner step: multiply by xA0
    let t181 = circuit_add(in64, t180); // Eval sumdlogdiv_a_den Horner step: add coefficient_8
    let t182 = circuit_mul(t181, in0); // Eval sumdlogdiv_a_den Horner step: multiply by xA0
    let t183 = circuit_add(in63, t182); // Eval sumdlogdiv_a_den Horner step: add coefficient_7
    let t184 = circuit_mul(t183, in0); // Eval sumdlogdiv_a_den Horner step: multiply by xA0
    let t185 = circuit_add(in62, t184); // Eval sumdlogdiv_a_den Horner step: add coefficient_6
    let t186 = circuit_mul(t185, in0); // Eval sumdlogdiv_a_den Horner step: multiply by xA0
    let t187 = circuit_add(in61, t186); // Eval sumdlogdiv_a_den Horner step: add coefficient_5
    let t188 = circuit_mul(t187, in0); // Eval sumdlogdiv_a_den Horner step: multiply by xA0
    let t189 = circuit_add(in60, t188); // Eval sumdlogdiv_a_den Horner step: add coefficient_4
    let t190 = circuit_mul(t189, in0); // Eval sumdlogdiv_a_den Horner step: multiply by xA0
    let t191 = circuit_add(in59, t190); // Eval sumdlogdiv_a_den Horner step: add coefficient_3
    let t192 = circuit_mul(t191, in0); // Eval sumdlogdiv_a_den Horner step: multiply by xA0
    let t193 = circuit_add(in58, t192); // Eval sumdlogdiv_a_den Horner step: add coefficient_2
    let t194 = circuit_mul(t193, in0); // Eval sumdlogdiv_a_den Horner step: multiply by xA0
    let t195 = circuit_add(in57, t194); // Eval sumdlogdiv_a_den Horner step: add coefficient_1
    let t196 = circuit_mul(t195, in0); // Eval sumdlogdiv_a_den Horner step: multiply by xA0
    let t197 = circuit_add(in56, t196); // Eval sumdlogdiv_a_den Horner step: add coefficient_0
    let t198 = circuit_inverse(t197);
    let t199 = circuit_mul(t97, t198);
    let t200 = circuit_mul(in157, in0); // Eval sumdlogdiv_b_num Horner step: multiply by xA0
    let t201 = circuit_add(in156, t200); // Eval sumdlogdiv_b_num Horner step: add coefficient_49
    let t202 = circuit_mul(t201, in0); // Eval sumdlogdiv_b_num Horner step: multiply by xA0
    let t203 = circuit_add(in155, t202); // Eval sumdlogdiv_b_num Horner step: add coefficient_48
    let t204 = circuit_mul(t203, in0); // Eval sumdlogdiv_b_num Horner step: multiply by xA0
    let t205 = circuit_add(in154, t204); // Eval sumdlogdiv_b_num Horner step: add coefficient_47
    let t206 = circuit_mul(t205, in0); // Eval sumdlogdiv_b_num Horner step: multiply by xA0
    let t207 = circuit_add(in153, t206); // Eval sumdlogdiv_b_num Horner step: add coefficient_46
    let t208 = circuit_mul(t207, in0); // Eval sumdlogdiv_b_num Horner step: multiply by xA0
    let t209 = circuit_add(in152, t208); // Eval sumdlogdiv_b_num Horner step: add coefficient_45
    let t210 = circuit_mul(t209, in0); // Eval sumdlogdiv_b_num Horner step: multiply by xA0
    let t211 = circuit_add(in151, t210); // Eval sumdlogdiv_b_num Horner step: add coefficient_44
    let t212 = circuit_mul(t211, in0); // Eval sumdlogdiv_b_num Horner step: multiply by xA0
    let t213 = circuit_add(in150, t212); // Eval sumdlogdiv_b_num Horner step: add coefficient_43
    let t214 = circuit_mul(t213, in0); // Eval sumdlogdiv_b_num Horner step: multiply by xA0
    let t215 = circuit_add(in149, t214); // Eval sumdlogdiv_b_num Horner step: add coefficient_42
    let t216 = circuit_mul(t215, in0); // Eval sumdlogdiv_b_num Horner step: multiply by xA0
    let t217 = circuit_add(in148, t216); // Eval sumdlogdiv_b_num Horner step: add coefficient_41
    let t218 = circuit_mul(t217, in0); // Eval sumdlogdiv_b_num Horner step: multiply by xA0
    let t219 = circuit_add(in147, t218); // Eval sumdlogdiv_b_num Horner step: add coefficient_40
    let t220 = circuit_mul(t219, in0); // Eval sumdlogdiv_b_num Horner step: multiply by xA0
    let t221 = circuit_add(in146, t220); // Eval sumdlogdiv_b_num Horner step: add coefficient_39
    let t222 = circuit_mul(t221, in0); // Eval sumdlogdiv_b_num Horner step: multiply by xA0
    let t223 = circuit_add(in145, t222); // Eval sumdlogdiv_b_num Horner step: add coefficient_38
    let t224 = circuit_mul(t223, in0); // Eval sumdlogdiv_b_num Horner step: multiply by xA0
    let t225 = circuit_add(in144, t224); // Eval sumdlogdiv_b_num Horner step: add coefficient_37
    let t226 = circuit_mul(t225, in0); // Eval sumdlogdiv_b_num Horner step: multiply by xA0
    let t227 = circuit_add(in143, t226); // Eval sumdlogdiv_b_num Horner step: add coefficient_36
    let t228 = circuit_mul(t227, in0); // Eval sumdlogdiv_b_num Horner step: multiply by xA0
    let t229 = circuit_add(in142, t228); // Eval sumdlogdiv_b_num Horner step: add coefficient_35
    let t230 = circuit_mul(t229, in0); // Eval sumdlogdiv_b_num Horner step: multiply by xA0
    let t231 = circuit_add(in141, t230); // Eval sumdlogdiv_b_num Horner step: add coefficient_34
    let t232 = circuit_mul(t231, in0); // Eval sumdlogdiv_b_num Horner step: multiply by xA0
    let t233 = circuit_add(in140, t232); // Eval sumdlogdiv_b_num Horner step: add coefficient_33
    let t234 = circuit_mul(t233, in0); // Eval sumdlogdiv_b_num Horner step: multiply by xA0
    let t235 = circuit_add(in139, t234); // Eval sumdlogdiv_b_num Horner step: add coefficient_32
    let t236 = circuit_mul(t235, in0); // Eval sumdlogdiv_b_num Horner step: multiply by xA0
    let t237 = circuit_add(in138, t236); // Eval sumdlogdiv_b_num Horner step: add coefficient_31
    let t238 = circuit_mul(t237, in0); // Eval sumdlogdiv_b_num Horner step: multiply by xA0
    let t239 = circuit_add(in137, t238); // Eval sumdlogdiv_b_num Horner step: add coefficient_30
    let t240 = circuit_mul(t239, in0); // Eval sumdlogdiv_b_num Horner step: multiply by xA0
    let t241 = circuit_add(in136, t240); // Eval sumdlogdiv_b_num Horner step: add coefficient_29
    let t242 = circuit_mul(t241, in0); // Eval sumdlogdiv_b_num Horner step: multiply by xA0
    let t243 = circuit_add(in135, t242); // Eval sumdlogdiv_b_num Horner step: add coefficient_28
    let t244 = circuit_mul(t243, in0); // Eval sumdlogdiv_b_num Horner step: multiply by xA0
    let t245 = circuit_add(in134, t244); // Eval sumdlogdiv_b_num Horner step: add coefficient_27
    let t246 = circuit_mul(t245, in0); // Eval sumdlogdiv_b_num Horner step: multiply by xA0
    let t247 = circuit_add(in133, t246); // Eval sumdlogdiv_b_num Horner step: add coefficient_26
    let t248 = circuit_mul(t247, in0); // Eval sumdlogdiv_b_num Horner step: multiply by xA0
    let t249 = circuit_add(in132, t248); // Eval sumdlogdiv_b_num Horner step: add coefficient_25
    let t250 = circuit_mul(t249, in0); // Eval sumdlogdiv_b_num Horner step: multiply by xA0
    let t251 = circuit_add(in131, t250); // Eval sumdlogdiv_b_num Horner step: add coefficient_24
    let t252 = circuit_mul(t251, in0); // Eval sumdlogdiv_b_num Horner step: multiply by xA0
    let t253 = circuit_add(in130, t252); // Eval sumdlogdiv_b_num Horner step: add coefficient_23
    let t254 = circuit_mul(t253, in0); // Eval sumdlogdiv_b_num Horner step: multiply by xA0
    let t255 = circuit_add(in129, t254); // Eval sumdlogdiv_b_num Horner step: add coefficient_22
    let t256 = circuit_mul(t255, in0); // Eval sumdlogdiv_b_num Horner step: multiply by xA0
    let t257 = circuit_add(in128, t256); // Eval sumdlogdiv_b_num Horner step: add coefficient_21
    let t258 = circuit_mul(t257, in0); // Eval sumdlogdiv_b_num Horner step: multiply by xA0
    let t259 = circuit_add(in127, t258); // Eval sumdlogdiv_b_num Horner step: add coefficient_20
    let t260 = circuit_mul(t259, in0); // Eval sumdlogdiv_b_num Horner step: multiply by xA0
    let t261 = circuit_add(in126, t260); // Eval sumdlogdiv_b_num Horner step: add coefficient_19
    let t262 = circuit_mul(t261, in0); // Eval sumdlogdiv_b_num Horner step: multiply by xA0
    let t263 = circuit_add(in125, t262); // Eval sumdlogdiv_b_num Horner step: add coefficient_18
    let t264 = circuit_mul(t263, in0); // Eval sumdlogdiv_b_num Horner step: multiply by xA0
    let t265 = circuit_add(in124, t264); // Eval sumdlogdiv_b_num Horner step: add coefficient_17
    let t266 = circuit_mul(t265, in0); // Eval sumdlogdiv_b_num Horner step: multiply by xA0
    let t267 = circuit_add(in123, t266); // Eval sumdlogdiv_b_num Horner step: add coefficient_16
    let t268 = circuit_mul(t267, in0); // Eval sumdlogdiv_b_num Horner step: multiply by xA0
    let t269 = circuit_add(in122, t268); // Eval sumdlogdiv_b_num Horner step: add coefficient_15
    let t270 = circuit_mul(t269, in0); // Eval sumdlogdiv_b_num Horner step: multiply by xA0
    let t271 = circuit_add(in121, t270); // Eval sumdlogdiv_b_num Horner step: add coefficient_14
    let t272 = circuit_mul(t271, in0); // Eval sumdlogdiv_b_num Horner step: multiply by xA0
    let t273 = circuit_add(in120, t272); // Eval sumdlogdiv_b_num Horner step: add coefficient_13
    let t274 = circuit_mul(t273, in0); // Eval sumdlogdiv_b_num Horner step: multiply by xA0
    let t275 = circuit_add(in119, t274); // Eval sumdlogdiv_b_num Horner step: add coefficient_12
    let t276 = circuit_mul(t275, in0); // Eval sumdlogdiv_b_num Horner step: multiply by xA0
    let t277 = circuit_add(in118, t276); // Eval sumdlogdiv_b_num Horner step: add coefficient_11
    let t278 = circuit_mul(t277, in0); // Eval sumdlogdiv_b_num Horner step: multiply by xA0
    let t279 = circuit_add(in117, t278); // Eval sumdlogdiv_b_num Horner step: add coefficient_10
    let t280 = circuit_mul(t279, in0); // Eval sumdlogdiv_b_num Horner step: multiply by xA0
    let t281 = circuit_add(in116, t280); // Eval sumdlogdiv_b_num Horner step: add coefficient_9
    let t282 = circuit_mul(t281, in0); // Eval sumdlogdiv_b_num Horner step: multiply by xA0
    let t283 = circuit_add(in115, t282); // Eval sumdlogdiv_b_num Horner step: add coefficient_8
    let t284 = circuit_mul(t283, in0); // Eval sumdlogdiv_b_num Horner step: multiply by xA0
    let t285 = circuit_add(in114, t284); // Eval sumdlogdiv_b_num Horner step: add coefficient_7
    let t286 = circuit_mul(t285, in0); // Eval sumdlogdiv_b_num Horner step: multiply by xA0
    let t287 = circuit_add(in113, t286); // Eval sumdlogdiv_b_num Horner step: add coefficient_6
    let t288 = circuit_mul(t287, in0); // Eval sumdlogdiv_b_num Horner step: multiply by xA0
    let t289 = circuit_add(in112, t288); // Eval sumdlogdiv_b_num Horner step: add coefficient_5
    let t290 = circuit_mul(t289, in0); // Eval sumdlogdiv_b_num Horner step: multiply by xA0
    let t291 = circuit_add(in111, t290); // Eval sumdlogdiv_b_num Horner step: add coefficient_4
    let t292 = circuit_mul(t291, in0); // Eval sumdlogdiv_b_num Horner step: multiply by xA0
    let t293 = circuit_add(in110, t292); // Eval sumdlogdiv_b_num Horner step: add coefficient_3
    let t294 = circuit_mul(t293, in0); // Eval sumdlogdiv_b_num Horner step: multiply by xA0
    let t295 = circuit_add(in109, t294); // Eval sumdlogdiv_b_num Horner step: add coefficient_2
    let t296 = circuit_mul(t295, in0); // Eval sumdlogdiv_b_num Horner step: multiply by xA0
    let t297 = circuit_add(in108, t296); // Eval sumdlogdiv_b_num Horner step: add coefficient_1
    let t298 = circuit_mul(t297, in0); // Eval sumdlogdiv_b_num Horner step: multiply by xA0
    let t299 = circuit_add(in107, t298); // Eval sumdlogdiv_b_num Horner step: add coefficient_0
    let t300 = circuit_mul(in211, in0); // Eval sumdlogdiv_b_den Horner step: multiply by xA0
    let t301 = circuit_add(in210, t300); // Eval sumdlogdiv_b_den Horner step: add coefficient_52
    let t302 = circuit_mul(t301, in0); // Eval sumdlogdiv_b_den Horner step: multiply by xA0
    let t303 = circuit_add(in209, t302); // Eval sumdlogdiv_b_den Horner step: add coefficient_51
    let t304 = circuit_mul(t303, in0); // Eval sumdlogdiv_b_den Horner step: multiply by xA0
    let t305 = circuit_add(in208, t304); // Eval sumdlogdiv_b_den Horner step: add coefficient_50
    let t306 = circuit_mul(t305, in0); // Eval sumdlogdiv_b_den Horner step: multiply by xA0
    let t307 = circuit_add(in207, t306); // Eval sumdlogdiv_b_den Horner step: add coefficient_49
    let t308 = circuit_mul(t307, in0); // Eval sumdlogdiv_b_den Horner step: multiply by xA0
    let t309 = circuit_add(in206, t308); // Eval sumdlogdiv_b_den Horner step: add coefficient_48
    let t310 = circuit_mul(t309, in0); // Eval sumdlogdiv_b_den Horner step: multiply by xA0
    let t311 = circuit_add(in205, t310); // Eval sumdlogdiv_b_den Horner step: add coefficient_47
    let t312 = circuit_mul(t311, in0); // Eval sumdlogdiv_b_den Horner step: multiply by xA0
    let t313 = circuit_add(in204, t312); // Eval sumdlogdiv_b_den Horner step: add coefficient_46
    let t314 = circuit_mul(t313, in0); // Eval sumdlogdiv_b_den Horner step: multiply by xA0
    let t315 = circuit_add(in203, t314); // Eval sumdlogdiv_b_den Horner step: add coefficient_45
    let t316 = circuit_mul(t315, in0); // Eval sumdlogdiv_b_den Horner step: multiply by xA0
    let t317 = circuit_add(in202, t316); // Eval sumdlogdiv_b_den Horner step: add coefficient_44
    let t318 = circuit_mul(t317, in0); // Eval sumdlogdiv_b_den Horner step: multiply by xA0
    let t319 = circuit_add(in201, t318); // Eval sumdlogdiv_b_den Horner step: add coefficient_43
    let t320 = circuit_mul(t319, in0); // Eval sumdlogdiv_b_den Horner step: multiply by xA0
    let t321 = circuit_add(in200, t320); // Eval sumdlogdiv_b_den Horner step: add coefficient_42
    let t322 = circuit_mul(t321, in0); // Eval sumdlogdiv_b_den Horner step: multiply by xA0
    let t323 = circuit_add(in199, t322); // Eval sumdlogdiv_b_den Horner step: add coefficient_41
    let t324 = circuit_mul(t323, in0); // Eval sumdlogdiv_b_den Horner step: multiply by xA0
    let t325 = circuit_add(in198, t324); // Eval sumdlogdiv_b_den Horner step: add coefficient_40
    let t326 = circuit_mul(t325, in0); // Eval sumdlogdiv_b_den Horner step: multiply by xA0
    let t327 = circuit_add(in197, t326); // Eval sumdlogdiv_b_den Horner step: add coefficient_39
    let t328 = circuit_mul(t327, in0); // Eval sumdlogdiv_b_den Horner step: multiply by xA0
    let t329 = circuit_add(in196, t328); // Eval sumdlogdiv_b_den Horner step: add coefficient_38
    let t330 = circuit_mul(t329, in0); // Eval sumdlogdiv_b_den Horner step: multiply by xA0
    let t331 = circuit_add(in195, t330); // Eval sumdlogdiv_b_den Horner step: add coefficient_37
    let t332 = circuit_mul(t331, in0); // Eval sumdlogdiv_b_den Horner step: multiply by xA0
    let t333 = circuit_add(in194, t332); // Eval sumdlogdiv_b_den Horner step: add coefficient_36
    let t334 = circuit_mul(t333, in0); // Eval sumdlogdiv_b_den Horner step: multiply by xA0
    let t335 = circuit_add(in193, t334); // Eval sumdlogdiv_b_den Horner step: add coefficient_35
    let t336 = circuit_mul(t335, in0); // Eval sumdlogdiv_b_den Horner step: multiply by xA0
    let t337 = circuit_add(in192, t336); // Eval sumdlogdiv_b_den Horner step: add coefficient_34
    let t338 = circuit_mul(t337, in0); // Eval sumdlogdiv_b_den Horner step: multiply by xA0
    let t339 = circuit_add(in191, t338); // Eval sumdlogdiv_b_den Horner step: add coefficient_33
    let t340 = circuit_mul(t339, in0); // Eval sumdlogdiv_b_den Horner step: multiply by xA0
    let t341 = circuit_add(in190, t340); // Eval sumdlogdiv_b_den Horner step: add coefficient_32
    let t342 = circuit_mul(t341, in0); // Eval sumdlogdiv_b_den Horner step: multiply by xA0
    let t343 = circuit_add(in189, t342); // Eval sumdlogdiv_b_den Horner step: add coefficient_31
    let t344 = circuit_mul(t343, in0); // Eval sumdlogdiv_b_den Horner step: multiply by xA0
    let t345 = circuit_add(in188, t344); // Eval sumdlogdiv_b_den Horner step: add coefficient_30
    let t346 = circuit_mul(t345, in0); // Eval sumdlogdiv_b_den Horner step: multiply by xA0
    let t347 = circuit_add(in187, t346); // Eval sumdlogdiv_b_den Horner step: add coefficient_29
    let t348 = circuit_mul(t347, in0); // Eval sumdlogdiv_b_den Horner step: multiply by xA0
    let t349 = circuit_add(in186, t348); // Eval sumdlogdiv_b_den Horner step: add coefficient_28
    let t350 = circuit_mul(t349, in0); // Eval sumdlogdiv_b_den Horner step: multiply by xA0
    let t351 = circuit_add(in185, t350); // Eval sumdlogdiv_b_den Horner step: add coefficient_27
    let t352 = circuit_mul(t351, in0); // Eval sumdlogdiv_b_den Horner step: multiply by xA0
    let t353 = circuit_add(in184, t352); // Eval sumdlogdiv_b_den Horner step: add coefficient_26
    let t354 = circuit_mul(t353, in0); // Eval sumdlogdiv_b_den Horner step: multiply by xA0
    let t355 = circuit_add(in183, t354); // Eval sumdlogdiv_b_den Horner step: add coefficient_25
    let t356 = circuit_mul(t355, in0); // Eval sumdlogdiv_b_den Horner step: multiply by xA0
    let t357 = circuit_add(in182, t356); // Eval sumdlogdiv_b_den Horner step: add coefficient_24
    let t358 = circuit_mul(t357, in0); // Eval sumdlogdiv_b_den Horner step: multiply by xA0
    let t359 = circuit_add(in181, t358); // Eval sumdlogdiv_b_den Horner step: add coefficient_23
    let t360 = circuit_mul(t359, in0); // Eval sumdlogdiv_b_den Horner step: multiply by xA0
    let t361 = circuit_add(in180, t360); // Eval sumdlogdiv_b_den Horner step: add coefficient_22
    let t362 = circuit_mul(t361, in0); // Eval sumdlogdiv_b_den Horner step: multiply by xA0
    let t363 = circuit_add(in179, t362); // Eval sumdlogdiv_b_den Horner step: add coefficient_21
    let t364 = circuit_mul(t363, in0); // Eval sumdlogdiv_b_den Horner step: multiply by xA0
    let t365 = circuit_add(in178, t364); // Eval sumdlogdiv_b_den Horner step: add coefficient_20
    let t366 = circuit_mul(t365, in0); // Eval sumdlogdiv_b_den Horner step: multiply by xA0
    let t367 = circuit_add(in177, t366); // Eval sumdlogdiv_b_den Horner step: add coefficient_19
    let t368 = circuit_mul(t367, in0); // Eval sumdlogdiv_b_den Horner step: multiply by xA0
    let t369 = circuit_add(in176, t368); // Eval sumdlogdiv_b_den Horner step: add coefficient_18
    let t370 = circuit_mul(t369, in0); // Eval sumdlogdiv_b_den Horner step: multiply by xA0
    let t371 = circuit_add(in175, t370); // Eval sumdlogdiv_b_den Horner step: add coefficient_17
    let t372 = circuit_mul(t371, in0); // Eval sumdlogdiv_b_den Horner step: multiply by xA0
    let t373 = circuit_add(in174, t372); // Eval sumdlogdiv_b_den Horner step: add coefficient_16
    let t374 = circuit_mul(t373, in0); // Eval sumdlogdiv_b_den Horner step: multiply by xA0
    let t375 = circuit_add(in173, t374); // Eval sumdlogdiv_b_den Horner step: add coefficient_15
    let t376 = circuit_mul(t375, in0); // Eval sumdlogdiv_b_den Horner step: multiply by xA0
    let t377 = circuit_add(in172, t376); // Eval sumdlogdiv_b_den Horner step: add coefficient_14
    let t378 = circuit_mul(t377, in0); // Eval sumdlogdiv_b_den Horner step: multiply by xA0
    let t379 = circuit_add(in171, t378); // Eval sumdlogdiv_b_den Horner step: add coefficient_13
    let t380 = circuit_mul(t379, in0); // Eval sumdlogdiv_b_den Horner step: multiply by xA0
    let t381 = circuit_add(in170, t380); // Eval sumdlogdiv_b_den Horner step: add coefficient_12
    let t382 = circuit_mul(t381, in0); // Eval sumdlogdiv_b_den Horner step: multiply by xA0
    let t383 = circuit_add(in169, t382); // Eval sumdlogdiv_b_den Horner step: add coefficient_11
    let t384 = circuit_mul(t383, in0); // Eval sumdlogdiv_b_den Horner step: multiply by xA0
    let t385 = circuit_add(in168, t384); // Eval sumdlogdiv_b_den Horner step: add coefficient_10
    let t386 = circuit_mul(t385, in0); // Eval sumdlogdiv_b_den Horner step: multiply by xA0
    let t387 = circuit_add(in167, t386); // Eval sumdlogdiv_b_den Horner step: add coefficient_9
    let t388 = circuit_mul(t387, in0); // Eval sumdlogdiv_b_den Horner step: multiply by xA0
    let t389 = circuit_add(in166, t388); // Eval sumdlogdiv_b_den Horner step: add coefficient_8
    let t390 = circuit_mul(t389, in0); // Eval sumdlogdiv_b_den Horner step: multiply by xA0
    let t391 = circuit_add(in165, t390); // Eval sumdlogdiv_b_den Horner step: add coefficient_7
    let t392 = circuit_mul(t391, in0); // Eval sumdlogdiv_b_den Horner step: multiply by xA0
    let t393 = circuit_add(in164, t392); // Eval sumdlogdiv_b_den Horner step: add coefficient_6
    let t394 = circuit_mul(t393, in0); // Eval sumdlogdiv_b_den Horner step: multiply by xA0
    let t395 = circuit_add(in163, t394); // Eval sumdlogdiv_b_den Horner step: add coefficient_5
    let t396 = circuit_mul(t395, in0); // Eval sumdlogdiv_b_den Horner step: multiply by xA0
    let t397 = circuit_add(in162, t396); // Eval sumdlogdiv_b_den Horner step: add coefficient_4
    let t398 = circuit_mul(t397, in0); // Eval sumdlogdiv_b_den Horner step: multiply by xA0
    let t399 = circuit_add(in161, t398); // Eval sumdlogdiv_b_den Horner step: add coefficient_3
    let t400 = circuit_mul(t399, in0); // Eval sumdlogdiv_b_den Horner step: multiply by xA0
    let t401 = circuit_add(in160, t400); // Eval sumdlogdiv_b_den Horner step: add coefficient_2
    let t402 = circuit_mul(t401, in0); // Eval sumdlogdiv_b_den Horner step: multiply by xA0
    let t403 = circuit_add(in159, t402); // Eval sumdlogdiv_b_den Horner step: add coefficient_1
    let t404 = circuit_mul(t403, in0); // Eval sumdlogdiv_b_den Horner step: multiply by xA0
    let t405 = circuit_add(in158, t404); // Eval sumdlogdiv_b_den Horner step: add coefficient_0
    let t406 = circuit_inverse(t405);
    let t407 = circuit_mul(t299, t406);
    let t408 = circuit_mul(in1, t407);
    let t409 = circuit_add(t199, t408);
    let t410 = circuit_mul(in55, in2); // Eval sumdlogdiv_a_num Horner step: multiply by xA2
    let t411 = circuit_add(in54, t410); // Eval sumdlogdiv_a_num Horner step: add coefficient_48
    let t412 = circuit_mul(t411, in2); // Eval sumdlogdiv_a_num Horner step: multiply by xA2
    let t413 = circuit_add(in53, t412); // Eval sumdlogdiv_a_num Horner step: add coefficient_47
    let t414 = circuit_mul(t413, in2); // Eval sumdlogdiv_a_num Horner step: multiply by xA2
    let t415 = circuit_add(in52, t414); // Eval sumdlogdiv_a_num Horner step: add coefficient_46
    let t416 = circuit_mul(t415, in2); // Eval sumdlogdiv_a_num Horner step: multiply by xA2
    let t417 = circuit_add(in51, t416); // Eval sumdlogdiv_a_num Horner step: add coefficient_45
    let t418 = circuit_mul(t417, in2); // Eval sumdlogdiv_a_num Horner step: multiply by xA2
    let t419 = circuit_add(in50, t418); // Eval sumdlogdiv_a_num Horner step: add coefficient_44
    let t420 = circuit_mul(t419, in2); // Eval sumdlogdiv_a_num Horner step: multiply by xA2
    let t421 = circuit_add(in49, t420); // Eval sumdlogdiv_a_num Horner step: add coefficient_43
    let t422 = circuit_mul(t421, in2); // Eval sumdlogdiv_a_num Horner step: multiply by xA2
    let t423 = circuit_add(in48, t422); // Eval sumdlogdiv_a_num Horner step: add coefficient_42
    let t424 = circuit_mul(t423, in2); // Eval sumdlogdiv_a_num Horner step: multiply by xA2
    let t425 = circuit_add(in47, t424); // Eval sumdlogdiv_a_num Horner step: add coefficient_41
    let t426 = circuit_mul(t425, in2); // Eval sumdlogdiv_a_num Horner step: multiply by xA2
    let t427 = circuit_add(in46, t426); // Eval sumdlogdiv_a_num Horner step: add coefficient_40
    let t428 = circuit_mul(t427, in2); // Eval sumdlogdiv_a_num Horner step: multiply by xA2
    let t429 = circuit_add(in45, t428); // Eval sumdlogdiv_a_num Horner step: add coefficient_39
    let t430 = circuit_mul(t429, in2); // Eval sumdlogdiv_a_num Horner step: multiply by xA2
    let t431 = circuit_add(in44, t430); // Eval sumdlogdiv_a_num Horner step: add coefficient_38
    let t432 = circuit_mul(t431, in2); // Eval sumdlogdiv_a_num Horner step: multiply by xA2
    let t433 = circuit_add(in43, t432); // Eval sumdlogdiv_a_num Horner step: add coefficient_37
    let t434 = circuit_mul(t433, in2); // Eval sumdlogdiv_a_num Horner step: multiply by xA2
    let t435 = circuit_add(in42, t434); // Eval sumdlogdiv_a_num Horner step: add coefficient_36
    let t436 = circuit_mul(t435, in2); // Eval sumdlogdiv_a_num Horner step: multiply by xA2
    let t437 = circuit_add(in41, t436); // Eval sumdlogdiv_a_num Horner step: add coefficient_35
    let t438 = circuit_mul(t437, in2); // Eval sumdlogdiv_a_num Horner step: multiply by xA2
    let t439 = circuit_add(in40, t438); // Eval sumdlogdiv_a_num Horner step: add coefficient_34
    let t440 = circuit_mul(t439, in2); // Eval sumdlogdiv_a_num Horner step: multiply by xA2
    let t441 = circuit_add(in39, t440); // Eval sumdlogdiv_a_num Horner step: add coefficient_33
    let t442 = circuit_mul(t441, in2); // Eval sumdlogdiv_a_num Horner step: multiply by xA2
    let t443 = circuit_add(in38, t442); // Eval sumdlogdiv_a_num Horner step: add coefficient_32
    let t444 = circuit_mul(t443, in2); // Eval sumdlogdiv_a_num Horner step: multiply by xA2
    let t445 = circuit_add(in37, t444); // Eval sumdlogdiv_a_num Horner step: add coefficient_31
    let t446 = circuit_mul(t445, in2); // Eval sumdlogdiv_a_num Horner step: multiply by xA2
    let t447 = circuit_add(in36, t446); // Eval sumdlogdiv_a_num Horner step: add coefficient_30
    let t448 = circuit_mul(t447, in2); // Eval sumdlogdiv_a_num Horner step: multiply by xA2
    let t449 = circuit_add(in35, t448); // Eval sumdlogdiv_a_num Horner step: add coefficient_29
    let t450 = circuit_mul(t449, in2); // Eval sumdlogdiv_a_num Horner step: multiply by xA2
    let t451 = circuit_add(in34, t450); // Eval sumdlogdiv_a_num Horner step: add coefficient_28
    let t452 = circuit_mul(t451, in2); // Eval sumdlogdiv_a_num Horner step: multiply by xA2
    let t453 = circuit_add(in33, t452); // Eval sumdlogdiv_a_num Horner step: add coefficient_27
    let t454 = circuit_mul(t453, in2); // Eval sumdlogdiv_a_num Horner step: multiply by xA2
    let t455 = circuit_add(in32, t454); // Eval sumdlogdiv_a_num Horner step: add coefficient_26
    let t456 = circuit_mul(t455, in2); // Eval sumdlogdiv_a_num Horner step: multiply by xA2
    let t457 = circuit_add(in31, t456); // Eval sumdlogdiv_a_num Horner step: add coefficient_25
    let t458 = circuit_mul(t457, in2); // Eval sumdlogdiv_a_num Horner step: multiply by xA2
    let t459 = circuit_add(in30, t458); // Eval sumdlogdiv_a_num Horner step: add coefficient_24
    let t460 = circuit_mul(t459, in2); // Eval sumdlogdiv_a_num Horner step: multiply by xA2
    let t461 = circuit_add(in29, t460); // Eval sumdlogdiv_a_num Horner step: add coefficient_23
    let t462 = circuit_mul(t461, in2); // Eval sumdlogdiv_a_num Horner step: multiply by xA2
    let t463 = circuit_add(in28, t462); // Eval sumdlogdiv_a_num Horner step: add coefficient_22
    let t464 = circuit_mul(t463, in2); // Eval sumdlogdiv_a_num Horner step: multiply by xA2
    let t465 = circuit_add(in27, t464); // Eval sumdlogdiv_a_num Horner step: add coefficient_21
    let t466 = circuit_mul(t465, in2); // Eval sumdlogdiv_a_num Horner step: multiply by xA2
    let t467 = circuit_add(in26, t466); // Eval sumdlogdiv_a_num Horner step: add coefficient_20
    let t468 = circuit_mul(t467, in2); // Eval sumdlogdiv_a_num Horner step: multiply by xA2
    let t469 = circuit_add(in25, t468); // Eval sumdlogdiv_a_num Horner step: add coefficient_19
    let t470 = circuit_mul(t469, in2); // Eval sumdlogdiv_a_num Horner step: multiply by xA2
    let t471 = circuit_add(in24, t470); // Eval sumdlogdiv_a_num Horner step: add coefficient_18
    let t472 = circuit_mul(t471, in2); // Eval sumdlogdiv_a_num Horner step: multiply by xA2
    let t473 = circuit_add(in23, t472); // Eval sumdlogdiv_a_num Horner step: add coefficient_17
    let t474 = circuit_mul(t473, in2); // Eval sumdlogdiv_a_num Horner step: multiply by xA2
    let t475 = circuit_add(in22, t474); // Eval sumdlogdiv_a_num Horner step: add coefficient_16
    let t476 = circuit_mul(t475, in2); // Eval sumdlogdiv_a_num Horner step: multiply by xA2
    let t477 = circuit_add(in21, t476); // Eval sumdlogdiv_a_num Horner step: add coefficient_15
    let t478 = circuit_mul(t477, in2); // Eval sumdlogdiv_a_num Horner step: multiply by xA2
    let t479 = circuit_add(in20, t478); // Eval sumdlogdiv_a_num Horner step: add coefficient_14
    let t480 = circuit_mul(t479, in2); // Eval sumdlogdiv_a_num Horner step: multiply by xA2
    let t481 = circuit_add(in19, t480); // Eval sumdlogdiv_a_num Horner step: add coefficient_13
    let t482 = circuit_mul(t481, in2); // Eval sumdlogdiv_a_num Horner step: multiply by xA2
    let t483 = circuit_add(in18, t482); // Eval sumdlogdiv_a_num Horner step: add coefficient_12
    let t484 = circuit_mul(t483, in2); // Eval sumdlogdiv_a_num Horner step: multiply by xA2
    let t485 = circuit_add(in17, t484); // Eval sumdlogdiv_a_num Horner step: add coefficient_11
    let t486 = circuit_mul(t485, in2); // Eval sumdlogdiv_a_num Horner step: multiply by xA2
    let t487 = circuit_add(in16, t486); // Eval sumdlogdiv_a_num Horner step: add coefficient_10
    let t488 = circuit_mul(t487, in2); // Eval sumdlogdiv_a_num Horner step: multiply by xA2
    let t489 = circuit_add(in15, t488); // Eval sumdlogdiv_a_num Horner step: add coefficient_9
    let t490 = circuit_mul(t489, in2); // Eval sumdlogdiv_a_num Horner step: multiply by xA2
    let t491 = circuit_add(in14, t490); // Eval sumdlogdiv_a_num Horner step: add coefficient_8
    let t492 = circuit_mul(t491, in2); // Eval sumdlogdiv_a_num Horner step: multiply by xA2
    let t493 = circuit_add(in13, t492); // Eval sumdlogdiv_a_num Horner step: add coefficient_7
    let t494 = circuit_mul(t493, in2); // Eval sumdlogdiv_a_num Horner step: multiply by xA2
    let t495 = circuit_add(in12, t494); // Eval sumdlogdiv_a_num Horner step: add coefficient_6
    let t496 = circuit_mul(t495, in2); // Eval sumdlogdiv_a_num Horner step: multiply by xA2
    let t497 = circuit_add(in11, t496); // Eval sumdlogdiv_a_num Horner step: add coefficient_5
    let t498 = circuit_mul(t497, in2); // Eval sumdlogdiv_a_num Horner step: multiply by xA2
    let t499 = circuit_add(in10, t498); // Eval sumdlogdiv_a_num Horner step: add coefficient_4
    let t500 = circuit_mul(t499, in2); // Eval sumdlogdiv_a_num Horner step: multiply by xA2
    let t501 = circuit_add(in9, t500); // Eval sumdlogdiv_a_num Horner step: add coefficient_3
    let t502 = circuit_mul(t501, in2); // Eval sumdlogdiv_a_num Horner step: multiply by xA2
    let t503 = circuit_add(in8, t502); // Eval sumdlogdiv_a_num Horner step: add coefficient_2
    let t504 = circuit_mul(t503, in2); // Eval sumdlogdiv_a_num Horner step: multiply by xA2
    let t505 = circuit_add(in7, t504); // Eval sumdlogdiv_a_num Horner step: add coefficient_1
    let t506 = circuit_mul(t505, in2); // Eval sumdlogdiv_a_num Horner step: multiply by xA2
    let t507 = circuit_add(in6, t506); // Eval sumdlogdiv_a_num Horner step: add coefficient_0
    let t508 = circuit_mul(in106, in2); // Eval sumdlogdiv_a_den Horner step: multiply by xA2
    let t509 = circuit_add(in105, t508); // Eval sumdlogdiv_a_den Horner step: add coefficient_49
    let t510 = circuit_mul(t509, in2); // Eval sumdlogdiv_a_den Horner step: multiply by xA2
    let t511 = circuit_add(in104, t510); // Eval sumdlogdiv_a_den Horner step: add coefficient_48
    let t512 = circuit_mul(t511, in2); // Eval sumdlogdiv_a_den Horner step: multiply by xA2
    let t513 = circuit_add(in103, t512); // Eval sumdlogdiv_a_den Horner step: add coefficient_47
    let t514 = circuit_mul(t513, in2); // Eval sumdlogdiv_a_den Horner step: multiply by xA2
    let t515 = circuit_add(in102, t514); // Eval sumdlogdiv_a_den Horner step: add coefficient_46
    let t516 = circuit_mul(t515, in2); // Eval sumdlogdiv_a_den Horner step: multiply by xA2
    let t517 = circuit_add(in101, t516); // Eval sumdlogdiv_a_den Horner step: add coefficient_45
    let t518 = circuit_mul(t517, in2); // Eval sumdlogdiv_a_den Horner step: multiply by xA2
    let t519 = circuit_add(in100, t518); // Eval sumdlogdiv_a_den Horner step: add coefficient_44
    let t520 = circuit_mul(t519, in2); // Eval sumdlogdiv_a_den Horner step: multiply by xA2
    let t521 = circuit_add(in99, t520); // Eval sumdlogdiv_a_den Horner step: add coefficient_43
    let t522 = circuit_mul(t521, in2); // Eval sumdlogdiv_a_den Horner step: multiply by xA2
    let t523 = circuit_add(in98, t522); // Eval sumdlogdiv_a_den Horner step: add coefficient_42
    let t524 = circuit_mul(t523, in2); // Eval sumdlogdiv_a_den Horner step: multiply by xA2
    let t525 = circuit_add(in97, t524); // Eval sumdlogdiv_a_den Horner step: add coefficient_41
    let t526 = circuit_mul(t525, in2); // Eval sumdlogdiv_a_den Horner step: multiply by xA2
    let t527 = circuit_add(in96, t526); // Eval sumdlogdiv_a_den Horner step: add coefficient_40
    let t528 = circuit_mul(t527, in2); // Eval sumdlogdiv_a_den Horner step: multiply by xA2
    let t529 = circuit_add(in95, t528); // Eval sumdlogdiv_a_den Horner step: add coefficient_39
    let t530 = circuit_mul(t529, in2); // Eval sumdlogdiv_a_den Horner step: multiply by xA2
    let t531 = circuit_add(in94, t530); // Eval sumdlogdiv_a_den Horner step: add coefficient_38
    let t532 = circuit_mul(t531, in2); // Eval sumdlogdiv_a_den Horner step: multiply by xA2
    let t533 = circuit_add(in93, t532); // Eval sumdlogdiv_a_den Horner step: add coefficient_37
    let t534 = circuit_mul(t533, in2); // Eval sumdlogdiv_a_den Horner step: multiply by xA2
    let t535 = circuit_add(in92, t534); // Eval sumdlogdiv_a_den Horner step: add coefficient_36
    let t536 = circuit_mul(t535, in2); // Eval sumdlogdiv_a_den Horner step: multiply by xA2
    let t537 = circuit_add(in91, t536); // Eval sumdlogdiv_a_den Horner step: add coefficient_35
    let t538 = circuit_mul(t537, in2); // Eval sumdlogdiv_a_den Horner step: multiply by xA2
    let t539 = circuit_add(in90, t538); // Eval sumdlogdiv_a_den Horner step: add coefficient_34
    let t540 = circuit_mul(t539, in2); // Eval sumdlogdiv_a_den Horner step: multiply by xA2
    let t541 = circuit_add(in89, t540); // Eval sumdlogdiv_a_den Horner step: add coefficient_33
    let t542 = circuit_mul(t541, in2); // Eval sumdlogdiv_a_den Horner step: multiply by xA2
    let t543 = circuit_add(in88, t542); // Eval sumdlogdiv_a_den Horner step: add coefficient_32
    let t544 = circuit_mul(t543, in2); // Eval sumdlogdiv_a_den Horner step: multiply by xA2
    let t545 = circuit_add(in87, t544); // Eval sumdlogdiv_a_den Horner step: add coefficient_31
    let t546 = circuit_mul(t545, in2); // Eval sumdlogdiv_a_den Horner step: multiply by xA2
    let t547 = circuit_add(in86, t546); // Eval sumdlogdiv_a_den Horner step: add coefficient_30
    let t548 = circuit_mul(t547, in2); // Eval sumdlogdiv_a_den Horner step: multiply by xA2
    let t549 = circuit_add(in85, t548); // Eval sumdlogdiv_a_den Horner step: add coefficient_29
    let t550 = circuit_mul(t549, in2); // Eval sumdlogdiv_a_den Horner step: multiply by xA2
    let t551 = circuit_add(in84, t550); // Eval sumdlogdiv_a_den Horner step: add coefficient_28
    let t552 = circuit_mul(t551, in2); // Eval sumdlogdiv_a_den Horner step: multiply by xA2
    let t553 = circuit_add(in83, t552); // Eval sumdlogdiv_a_den Horner step: add coefficient_27
    let t554 = circuit_mul(t553, in2); // Eval sumdlogdiv_a_den Horner step: multiply by xA2
    let t555 = circuit_add(in82, t554); // Eval sumdlogdiv_a_den Horner step: add coefficient_26
    let t556 = circuit_mul(t555, in2); // Eval sumdlogdiv_a_den Horner step: multiply by xA2
    let t557 = circuit_add(in81, t556); // Eval sumdlogdiv_a_den Horner step: add coefficient_25
    let t558 = circuit_mul(t557, in2); // Eval sumdlogdiv_a_den Horner step: multiply by xA2
    let t559 = circuit_add(in80, t558); // Eval sumdlogdiv_a_den Horner step: add coefficient_24
    let t560 = circuit_mul(t559, in2); // Eval sumdlogdiv_a_den Horner step: multiply by xA2
    let t561 = circuit_add(in79, t560); // Eval sumdlogdiv_a_den Horner step: add coefficient_23
    let t562 = circuit_mul(t561, in2); // Eval sumdlogdiv_a_den Horner step: multiply by xA2
    let t563 = circuit_add(in78, t562); // Eval sumdlogdiv_a_den Horner step: add coefficient_22
    let t564 = circuit_mul(t563, in2); // Eval sumdlogdiv_a_den Horner step: multiply by xA2
    let t565 = circuit_add(in77, t564); // Eval sumdlogdiv_a_den Horner step: add coefficient_21
    let t566 = circuit_mul(t565, in2); // Eval sumdlogdiv_a_den Horner step: multiply by xA2
    let t567 = circuit_add(in76, t566); // Eval sumdlogdiv_a_den Horner step: add coefficient_20
    let t568 = circuit_mul(t567, in2); // Eval sumdlogdiv_a_den Horner step: multiply by xA2
    let t569 = circuit_add(in75, t568); // Eval sumdlogdiv_a_den Horner step: add coefficient_19
    let t570 = circuit_mul(t569, in2); // Eval sumdlogdiv_a_den Horner step: multiply by xA2
    let t571 = circuit_add(in74, t570); // Eval sumdlogdiv_a_den Horner step: add coefficient_18
    let t572 = circuit_mul(t571, in2); // Eval sumdlogdiv_a_den Horner step: multiply by xA2
    let t573 = circuit_add(in73, t572); // Eval sumdlogdiv_a_den Horner step: add coefficient_17
    let t574 = circuit_mul(t573, in2); // Eval sumdlogdiv_a_den Horner step: multiply by xA2
    let t575 = circuit_add(in72, t574); // Eval sumdlogdiv_a_den Horner step: add coefficient_16
    let t576 = circuit_mul(t575, in2); // Eval sumdlogdiv_a_den Horner step: multiply by xA2
    let t577 = circuit_add(in71, t576); // Eval sumdlogdiv_a_den Horner step: add coefficient_15
    let t578 = circuit_mul(t577, in2); // Eval sumdlogdiv_a_den Horner step: multiply by xA2
    let t579 = circuit_add(in70, t578); // Eval sumdlogdiv_a_den Horner step: add coefficient_14
    let t580 = circuit_mul(t579, in2); // Eval sumdlogdiv_a_den Horner step: multiply by xA2
    let t581 = circuit_add(in69, t580); // Eval sumdlogdiv_a_den Horner step: add coefficient_13
    let t582 = circuit_mul(t581, in2); // Eval sumdlogdiv_a_den Horner step: multiply by xA2
    let t583 = circuit_add(in68, t582); // Eval sumdlogdiv_a_den Horner step: add coefficient_12
    let t584 = circuit_mul(t583, in2); // Eval sumdlogdiv_a_den Horner step: multiply by xA2
    let t585 = circuit_add(in67, t584); // Eval sumdlogdiv_a_den Horner step: add coefficient_11
    let t586 = circuit_mul(t585, in2); // Eval sumdlogdiv_a_den Horner step: multiply by xA2
    let t587 = circuit_add(in66, t586); // Eval sumdlogdiv_a_den Horner step: add coefficient_10
    let t588 = circuit_mul(t587, in2); // Eval sumdlogdiv_a_den Horner step: multiply by xA2
    let t589 = circuit_add(in65, t588); // Eval sumdlogdiv_a_den Horner step: add coefficient_9
    let t590 = circuit_mul(t589, in2); // Eval sumdlogdiv_a_den Horner step: multiply by xA2
    let t591 = circuit_add(in64, t590); // Eval sumdlogdiv_a_den Horner step: add coefficient_8
    let t592 = circuit_mul(t591, in2); // Eval sumdlogdiv_a_den Horner step: multiply by xA2
    let t593 = circuit_add(in63, t592); // Eval sumdlogdiv_a_den Horner step: add coefficient_7
    let t594 = circuit_mul(t593, in2); // Eval sumdlogdiv_a_den Horner step: multiply by xA2
    let t595 = circuit_add(in62, t594); // Eval sumdlogdiv_a_den Horner step: add coefficient_6
    let t596 = circuit_mul(t595, in2); // Eval sumdlogdiv_a_den Horner step: multiply by xA2
    let t597 = circuit_add(in61, t596); // Eval sumdlogdiv_a_den Horner step: add coefficient_5
    let t598 = circuit_mul(t597, in2); // Eval sumdlogdiv_a_den Horner step: multiply by xA2
    let t599 = circuit_add(in60, t598); // Eval sumdlogdiv_a_den Horner step: add coefficient_4
    let t600 = circuit_mul(t599, in2); // Eval sumdlogdiv_a_den Horner step: multiply by xA2
    let t601 = circuit_add(in59, t600); // Eval sumdlogdiv_a_den Horner step: add coefficient_3
    let t602 = circuit_mul(t601, in2); // Eval sumdlogdiv_a_den Horner step: multiply by xA2
    let t603 = circuit_add(in58, t602); // Eval sumdlogdiv_a_den Horner step: add coefficient_2
    let t604 = circuit_mul(t603, in2); // Eval sumdlogdiv_a_den Horner step: multiply by xA2
    let t605 = circuit_add(in57, t604); // Eval sumdlogdiv_a_den Horner step: add coefficient_1
    let t606 = circuit_mul(t605, in2); // Eval sumdlogdiv_a_den Horner step: multiply by xA2
    let t607 = circuit_add(in56, t606); // Eval sumdlogdiv_a_den Horner step: add coefficient_0
    let t608 = circuit_inverse(t607);
    let t609 = circuit_mul(t507, t608);
    let t610 = circuit_mul(in157, in2); // Eval sumdlogdiv_b_num Horner step: multiply by xA2
    let t611 = circuit_add(in156, t610); // Eval sumdlogdiv_b_num Horner step: add coefficient_49
    let t612 = circuit_mul(t611, in2); // Eval sumdlogdiv_b_num Horner step: multiply by xA2
    let t613 = circuit_add(in155, t612); // Eval sumdlogdiv_b_num Horner step: add coefficient_48
    let t614 = circuit_mul(t613, in2); // Eval sumdlogdiv_b_num Horner step: multiply by xA2
    let t615 = circuit_add(in154, t614); // Eval sumdlogdiv_b_num Horner step: add coefficient_47
    let t616 = circuit_mul(t615, in2); // Eval sumdlogdiv_b_num Horner step: multiply by xA2
    let t617 = circuit_add(in153, t616); // Eval sumdlogdiv_b_num Horner step: add coefficient_46
    let t618 = circuit_mul(t617, in2); // Eval sumdlogdiv_b_num Horner step: multiply by xA2
    let t619 = circuit_add(in152, t618); // Eval sumdlogdiv_b_num Horner step: add coefficient_45
    let t620 = circuit_mul(t619, in2); // Eval sumdlogdiv_b_num Horner step: multiply by xA2
    let t621 = circuit_add(in151, t620); // Eval sumdlogdiv_b_num Horner step: add coefficient_44
    let t622 = circuit_mul(t621, in2); // Eval sumdlogdiv_b_num Horner step: multiply by xA2
    let t623 = circuit_add(in150, t622); // Eval sumdlogdiv_b_num Horner step: add coefficient_43
    let t624 = circuit_mul(t623, in2); // Eval sumdlogdiv_b_num Horner step: multiply by xA2
    let t625 = circuit_add(in149, t624); // Eval sumdlogdiv_b_num Horner step: add coefficient_42
    let t626 = circuit_mul(t625, in2); // Eval sumdlogdiv_b_num Horner step: multiply by xA2
    let t627 = circuit_add(in148, t626); // Eval sumdlogdiv_b_num Horner step: add coefficient_41
    let t628 = circuit_mul(t627, in2); // Eval sumdlogdiv_b_num Horner step: multiply by xA2
    let t629 = circuit_add(in147, t628); // Eval sumdlogdiv_b_num Horner step: add coefficient_40
    let t630 = circuit_mul(t629, in2); // Eval sumdlogdiv_b_num Horner step: multiply by xA2
    let t631 = circuit_add(in146, t630); // Eval sumdlogdiv_b_num Horner step: add coefficient_39
    let t632 = circuit_mul(t631, in2); // Eval sumdlogdiv_b_num Horner step: multiply by xA2
    let t633 = circuit_add(in145, t632); // Eval sumdlogdiv_b_num Horner step: add coefficient_38
    let t634 = circuit_mul(t633, in2); // Eval sumdlogdiv_b_num Horner step: multiply by xA2
    let t635 = circuit_add(in144, t634); // Eval sumdlogdiv_b_num Horner step: add coefficient_37
    let t636 = circuit_mul(t635, in2); // Eval sumdlogdiv_b_num Horner step: multiply by xA2
    let t637 = circuit_add(in143, t636); // Eval sumdlogdiv_b_num Horner step: add coefficient_36
    let t638 = circuit_mul(t637, in2); // Eval sumdlogdiv_b_num Horner step: multiply by xA2
    let t639 = circuit_add(in142, t638); // Eval sumdlogdiv_b_num Horner step: add coefficient_35
    let t640 = circuit_mul(t639, in2); // Eval sumdlogdiv_b_num Horner step: multiply by xA2
    let t641 = circuit_add(in141, t640); // Eval sumdlogdiv_b_num Horner step: add coefficient_34
    let t642 = circuit_mul(t641, in2); // Eval sumdlogdiv_b_num Horner step: multiply by xA2
    let t643 = circuit_add(in140, t642); // Eval sumdlogdiv_b_num Horner step: add coefficient_33
    let t644 = circuit_mul(t643, in2); // Eval sumdlogdiv_b_num Horner step: multiply by xA2
    let t645 = circuit_add(in139, t644); // Eval sumdlogdiv_b_num Horner step: add coefficient_32
    let t646 = circuit_mul(t645, in2); // Eval sumdlogdiv_b_num Horner step: multiply by xA2
    let t647 = circuit_add(in138, t646); // Eval sumdlogdiv_b_num Horner step: add coefficient_31
    let t648 = circuit_mul(t647, in2); // Eval sumdlogdiv_b_num Horner step: multiply by xA2
    let t649 = circuit_add(in137, t648); // Eval sumdlogdiv_b_num Horner step: add coefficient_30
    let t650 = circuit_mul(t649, in2); // Eval sumdlogdiv_b_num Horner step: multiply by xA2
    let t651 = circuit_add(in136, t650); // Eval sumdlogdiv_b_num Horner step: add coefficient_29
    let t652 = circuit_mul(t651, in2); // Eval sumdlogdiv_b_num Horner step: multiply by xA2
    let t653 = circuit_add(in135, t652); // Eval sumdlogdiv_b_num Horner step: add coefficient_28
    let t654 = circuit_mul(t653, in2); // Eval sumdlogdiv_b_num Horner step: multiply by xA2
    let t655 = circuit_add(in134, t654); // Eval sumdlogdiv_b_num Horner step: add coefficient_27
    let t656 = circuit_mul(t655, in2); // Eval sumdlogdiv_b_num Horner step: multiply by xA2
    let t657 = circuit_add(in133, t656); // Eval sumdlogdiv_b_num Horner step: add coefficient_26
    let t658 = circuit_mul(t657, in2); // Eval sumdlogdiv_b_num Horner step: multiply by xA2
    let t659 = circuit_add(in132, t658); // Eval sumdlogdiv_b_num Horner step: add coefficient_25
    let t660 = circuit_mul(t659, in2); // Eval sumdlogdiv_b_num Horner step: multiply by xA2
    let t661 = circuit_add(in131, t660); // Eval sumdlogdiv_b_num Horner step: add coefficient_24
    let t662 = circuit_mul(t661, in2); // Eval sumdlogdiv_b_num Horner step: multiply by xA2
    let t663 = circuit_add(in130, t662); // Eval sumdlogdiv_b_num Horner step: add coefficient_23
    let t664 = circuit_mul(t663, in2); // Eval sumdlogdiv_b_num Horner step: multiply by xA2
    let t665 = circuit_add(in129, t664); // Eval sumdlogdiv_b_num Horner step: add coefficient_22
    let t666 = circuit_mul(t665, in2); // Eval sumdlogdiv_b_num Horner step: multiply by xA2
    let t667 = circuit_add(in128, t666); // Eval sumdlogdiv_b_num Horner step: add coefficient_21
    let t668 = circuit_mul(t667, in2); // Eval sumdlogdiv_b_num Horner step: multiply by xA2
    let t669 = circuit_add(in127, t668); // Eval sumdlogdiv_b_num Horner step: add coefficient_20
    let t670 = circuit_mul(t669, in2); // Eval sumdlogdiv_b_num Horner step: multiply by xA2
    let t671 = circuit_add(in126, t670); // Eval sumdlogdiv_b_num Horner step: add coefficient_19
    let t672 = circuit_mul(t671, in2); // Eval sumdlogdiv_b_num Horner step: multiply by xA2
    let t673 = circuit_add(in125, t672); // Eval sumdlogdiv_b_num Horner step: add coefficient_18
    let t674 = circuit_mul(t673, in2); // Eval sumdlogdiv_b_num Horner step: multiply by xA2
    let t675 = circuit_add(in124, t674); // Eval sumdlogdiv_b_num Horner step: add coefficient_17
    let t676 = circuit_mul(t675, in2); // Eval sumdlogdiv_b_num Horner step: multiply by xA2
    let t677 = circuit_add(in123, t676); // Eval sumdlogdiv_b_num Horner step: add coefficient_16
    let t678 = circuit_mul(t677, in2); // Eval sumdlogdiv_b_num Horner step: multiply by xA2
    let t679 = circuit_add(in122, t678); // Eval sumdlogdiv_b_num Horner step: add coefficient_15
    let t680 = circuit_mul(t679, in2); // Eval sumdlogdiv_b_num Horner step: multiply by xA2
    let t681 = circuit_add(in121, t680); // Eval sumdlogdiv_b_num Horner step: add coefficient_14
    let t682 = circuit_mul(t681, in2); // Eval sumdlogdiv_b_num Horner step: multiply by xA2
    let t683 = circuit_add(in120, t682); // Eval sumdlogdiv_b_num Horner step: add coefficient_13
    let t684 = circuit_mul(t683, in2); // Eval sumdlogdiv_b_num Horner step: multiply by xA2
    let t685 = circuit_add(in119, t684); // Eval sumdlogdiv_b_num Horner step: add coefficient_12
    let t686 = circuit_mul(t685, in2); // Eval sumdlogdiv_b_num Horner step: multiply by xA2
    let t687 = circuit_add(in118, t686); // Eval sumdlogdiv_b_num Horner step: add coefficient_11
    let t688 = circuit_mul(t687, in2); // Eval sumdlogdiv_b_num Horner step: multiply by xA2
    let t689 = circuit_add(in117, t688); // Eval sumdlogdiv_b_num Horner step: add coefficient_10
    let t690 = circuit_mul(t689, in2); // Eval sumdlogdiv_b_num Horner step: multiply by xA2
    let t691 = circuit_add(in116, t690); // Eval sumdlogdiv_b_num Horner step: add coefficient_9
    let t692 = circuit_mul(t691, in2); // Eval sumdlogdiv_b_num Horner step: multiply by xA2
    let t693 = circuit_add(in115, t692); // Eval sumdlogdiv_b_num Horner step: add coefficient_8
    let t694 = circuit_mul(t693, in2); // Eval sumdlogdiv_b_num Horner step: multiply by xA2
    let t695 = circuit_add(in114, t694); // Eval sumdlogdiv_b_num Horner step: add coefficient_7
    let t696 = circuit_mul(t695, in2); // Eval sumdlogdiv_b_num Horner step: multiply by xA2
    let t697 = circuit_add(in113, t696); // Eval sumdlogdiv_b_num Horner step: add coefficient_6
    let t698 = circuit_mul(t697, in2); // Eval sumdlogdiv_b_num Horner step: multiply by xA2
    let t699 = circuit_add(in112, t698); // Eval sumdlogdiv_b_num Horner step: add coefficient_5
    let t700 = circuit_mul(t699, in2); // Eval sumdlogdiv_b_num Horner step: multiply by xA2
    let t701 = circuit_add(in111, t700); // Eval sumdlogdiv_b_num Horner step: add coefficient_4
    let t702 = circuit_mul(t701, in2); // Eval sumdlogdiv_b_num Horner step: multiply by xA2
    let t703 = circuit_add(in110, t702); // Eval sumdlogdiv_b_num Horner step: add coefficient_3
    let t704 = circuit_mul(t703, in2); // Eval sumdlogdiv_b_num Horner step: multiply by xA2
    let t705 = circuit_add(in109, t704); // Eval sumdlogdiv_b_num Horner step: add coefficient_2
    let t706 = circuit_mul(t705, in2); // Eval sumdlogdiv_b_num Horner step: multiply by xA2
    let t707 = circuit_add(in108, t706); // Eval sumdlogdiv_b_num Horner step: add coefficient_1
    let t708 = circuit_mul(t707, in2); // Eval sumdlogdiv_b_num Horner step: multiply by xA2
    let t709 = circuit_add(in107, t708); // Eval sumdlogdiv_b_num Horner step: add coefficient_0
    let t710 = circuit_mul(in211, in2); // Eval sumdlogdiv_b_den Horner step: multiply by xA2
    let t711 = circuit_add(in210, t710); // Eval sumdlogdiv_b_den Horner step: add coefficient_52
    let t712 = circuit_mul(t711, in2); // Eval sumdlogdiv_b_den Horner step: multiply by xA2
    let t713 = circuit_add(in209, t712); // Eval sumdlogdiv_b_den Horner step: add coefficient_51
    let t714 = circuit_mul(t713, in2); // Eval sumdlogdiv_b_den Horner step: multiply by xA2
    let t715 = circuit_add(in208, t714); // Eval sumdlogdiv_b_den Horner step: add coefficient_50
    let t716 = circuit_mul(t715, in2); // Eval sumdlogdiv_b_den Horner step: multiply by xA2
    let t717 = circuit_add(in207, t716); // Eval sumdlogdiv_b_den Horner step: add coefficient_49
    let t718 = circuit_mul(t717, in2); // Eval sumdlogdiv_b_den Horner step: multiply by xA2
    let t719 = circuit_add(in206, t718); // Eval sumdlogdiv_b_den Horner step: add coefficient_48
    let t720 = circuit_mul(t719, in2); // Eval sumdlogdiv_b_den Horner step: multiply by xA2
    let t721 = circuit_add(in205, t720); // Eval sumdlogdiv_b_den Horner step: add coefficient_47
    let t722 = circuit_mul(t721, in2); // Eval sumdlogdiv_b_den Horner step: multiply by xA2
    let t723 = circuit_add(in204, t722); // Eval sumdlogdiv_b_den Horner step: add coefficient_46
    let t724 = circuit_mul(t723, in2); // Eval sumdlogdiv_b_den Horner step: multiply by xA2
    let t725 = circuit_add(in203, t724); // Eval sumdlogdiv_b_den Horner step: add coefficient_45
    let t726 = circuit_mul(t725, in2); // Eval sumdlogdiv_b_den Horner step: multiply by xA2
    let t727 = circuit_add(in202, t726); // Eval sumdlogdiv_b_den Horner step: add coefficient_44
    let t728 = circuit_mul(t727, in2); // Eval sumdlogdiv_b_den Horner step: multiply by xA2
    let t729 = circuit_add(in201, t728); // Eval sumdlogdiv_b_den Horner step: add coefficient_43
    let t730 = circuit_mul(t729, in2); // Eval sumdlogdiv_b_den Horner step: multiply by xA2
    let t731 = circuit_add(in200, t730); // Eval sumdlogdiv_b_den Horner step: add coefficient_42
    let t732 = circuit_mul(t731, in2); // Eval sumdlogdiv_b_den Horner step: multiply by xA2
    let t733 = circuit_add(in199, t732); // Eval sumdlogdiv_b_den Horner step: add coefficient_41
    let t734 = circuit_mul(t733, in2); // Eval sumdlogdiv_b_den Horner step: multiply by xA2
    let t735 = circuit_add(in198, t734); // Eval sumdlogdiv_b_den Horner step: add coefficient_40
    let t736 = circuit_mul(t735, in2); // Eval sumdlogdiv_b_den Horner step: multiply by xA2
    let t737 = circuit_add(in197, t736); // Eval sumdlogdiv_b_den Horner step: add coefficient_39
    let t738 = circuit_mul(t737, in2); // Eval sumdlogdiv_b_den Horner step: multiply by xA2
    let t739 = circuit_add(in196, t738); // Eval sumdlogdiv_b_den Horner step: add coefficient_38
    let t740 = circuit_mul(t739, in2); // Eval sumdlogdiv_b_den Horner step: multiply by xA2
    let t741 = circuit_add(in195, t740); // Eval sumdlogdiv_b_den Horner step: add coefficient_37
    let t742 = circuit_mul(t741, in2); // Eval sumdlogdiv_b_den Horner step: multiply by xA2
    let t743 = circuit_add(in194, t742); // Eval sumdlogdiv_b_den Horner step: add coefficient_36
    let t744 = circuit_mul(t743, in2); // Eval sumdlogdiv_b_den Horner step: multiply by xA2
    let t745 = circuit_add(in193, t744); // Eval sumdlogdiv_b_den Horner step: add coefficient_35
    let t746 = circuit_mul(t745, in2); // Eval sumdlogdiv_b_den Horner step: multiply by xA2
    let t747 = circuit_add(in192, t746); // Eval sumdlogdiv_b_den Horner step: add coefficient_34
    let t748 = circuit_mul(t747, in2); // Eval sumdlogdiv_b_den Horner step: multiply by xA2
    let t749 = circuit_add(in191, t748); // Eval sumdlogdiv_b_den Horner step: add coefficient_33
    let t750 = circuit_mul(t749, in2); // Eval sumdlogdiv_b_den Horner step: multiply by xA2
    let t751 = circuit_add(in190, t750); // Eval sumdlogdiv_b_den Horner step: add coefficient_32
    let t752 = circuit_mul(t751, in2); // Eval sumdlogdiv_b_den Horner step: multiply by xA2
    let t753 = circuit_add(in189, t752); // Eval sumdlogdiv_b_den Horner step: add coefficient_31
    let t754 = circuit_mul(t753, in2); // Eval sumdlogdiv_b_den Horner step: multiply by xA2
    let t755 = circuit_add(in188, t754); // Eval sumdlogdiv_b_den Horner step: add coefficient_30
    let t756 = circuit_mul(t755, in2); // Eval sumdlogdiv_b_den Horner step: multiply by xA2
    let t757 = circuit_add(in187, t756); // Eval sumdlogdiv_b_den Horner step: add coefficient_29
    let t758 = circuit_mul(t757, in2); // Eval sumdlogdiv_b_den Horner step: multiply by xA2
    let t759 = circuit_add(in186, t758); // Eval sumdlogdiv_b_den Horner step: add coefficient_28
    let t760 = circuit_mul(t759, in2); // Eval sumdlogdiv_b_den Horner step: multiply by xA2
    let t761 = circuit_add(in185, t760); // Eval sumdlogdiv_b_den Horner step: add coefficient_27
    let t762 = circuit_mul(t761, in2); // Eval sumdlogdiv_b_den Horner step: multiply by xA2
    let t763 = circuit_add(in184, t762); // Eval sumdlogdiv_b_den Horner step: add coefficient_26
    let t764 = circuit_mul(t763, in2); // Eval sumdlogdiv_b_den Horner step: multiply by xA2
    let t765 = circuit_add(in183, t764); // Eval sumdlogdiv_b_den Horner step: add coefficient_25
    let t766 = circuit_mul(t765, in2); // Eval sumdlogdiv_b_den Horner step: multiply by xA2
    let t767 = circuit_add(in182, t766); // Eval sumdlogdiv_b_den Horner step: add coefficient_24
    let t768 = circuit_mul(t767, in2); // Eval sumdlogdiv_b_den Horner step: multiply by xA2
    let t769 = circuit_add(in181, t768); // Eval sumdlogdiv_b_den Horner step: add coefficient_23
    let t770 = circuit_mul(t769, in2); // Eval sumdlogdiv_b_den Horner step: multiply by xA2
    let t771 = circuit_add(in180, t770); // Eval sumdlogdiv_b_den Horner step: add coefficient_22
    let t772 = circuit_mul(t771, in2); // Eval sumdlogdiv_b_den Horner step: multiply by xA2
    let t773 = circuit_add(in179, t772); // Eval sumdlogdiv_b_den Horner step: add coefficient_21
    let t774 = circuit_mul(t773, in2); // Eval sumdlogdiv_b_den Horner step: multiply by xA2
    let t775 = circuit_add(in178, t774); // Eval sumdlogdiv_b_den Horner step: add coefficient_20
    let t776 = circuit_mul(t775, in2); // Eval sumdlogdiv_b_den Horner step: multiply by xA2
    let t777 = circuit_add(in177, t776); // Eval sumdlogdiv_b_den Horner step: add coefficient_19
    let t778 = circuit_mul(t777, in2); // Eval sumdlogdiv_b_den Horner step: multiply by xA2
    let t779 = circuit_add(in176, t778); // Eval sumdlogdiv_b_den Horner step: add coefficient_18
    let t780 = circuit_mul(t779, in2); // Eval sumdlogdiv_b_den Horner step: multiply by xA2
    let t781 = circuit_add(in175, t780); // Eval sumdlogdiv_b_den Horner step: add coefficient_17
    let t782 = circuit_mul(t781, in2); // Eval sumdlogdiv_b_den Horner step: multiply by xA2
    let t783 = circuit_add(in174, t782); // Eval sumdlogdiv_b_den Horner step: add coefficient_16
    let t784 = circuit_mul(t783, in2); // Eval sumdlogdiv_b_den Horner step: multiply by xA2
    let t785 = circuit_add(in173, t784); // Eval sumdlogdiv_b_den Horner step: add coefficient_15
    let t786 = circuit_mul(t785, in2); // Eval sumdlogdiv_b_den Horner step: multiply by xA2
    let t787 = circuit_add(in172, t786); // Eval sumdlogdiv_b_den Horner step: add coefficient_14
    let t788 = circuit_mul(t787, in2); // Eval sumdlogdiv_b_den Horner step: multiply by xA2
    let t789 = circuit_add(in171, t788); // Eval sumdlogdiv_b_den Horner step: add coefficient_13
    let t790 = circuit_mul(t789, in2); // Eval sumdlogdiv_b_den Horner step: multiply by xA2
    let t791 = circuit_add(in170, t790); // Eval sumdlogdiv_b_den Horner step: add coefficient_12
    let t792 = circuit_mul(t791, in2); // Eval sumdlogdiv_b_den Horner step: multiply by xA2
    let t793 = circuit_add(in169, t792); // Eval sumdlogdiv_b_den Horner step: add coefficient_11
    let t794 = circuit_mul(t793, in2); // Eval sumdlogdiv_b_den Horner step: multiply by xA2
    let t795 = circuit_add(in168, t794); // Eval sumdlogdiv_b_den Horner step: add coefficient_10
    let t796 = circuit_mul(t795, in2); // Eval sumdlogdiv_b_den Horner step: multiply by xA2
    let t797 = circuit_add(in167, t796); // Eval sumdlogdiv_b_den Horner step: add coefficient_9
    let t798 = circuit_mul(t797, in2); // Eval sumdlogdiv_b_den Horner step: multiply by xA2
    let t799 = circuit_add(in166, t798); // Eval sumdlogdiv_b_den Horner step: add coefficient_8
    let t800 = circuit_mul(t799, in2); // Eval sumdlogdiv_b_den Horner step: multiply by xA2
    let t801 = circuit_add(in165, t800); // Eval sumdlogdiv_b_den Horner step: add coefficient_7
    let t802 = circuit_mul(t801, in2); // Eval sumdlogdiv_b_den Horner step: multiply by xA2
    let t803 = circuit_add(in164, t802); // Eval sumdlogdiv_b_den Horner step: add coefficient_6
    let t804 = circuit_mul(t803, in2); // Eval sumdlogdiv_b_den Horner step: multiply by xA2
    let t805 = circuit_add(in163, t804); // Eval sumdlogdiv_b_den Horner step: add coefficient_5
    let t806 = circuit_mul(t805, in2); // Eval sumdlogdiv_b_den Horner step: multiply by xA2
    let t807 = circuit_add(in162, t806); // Eval sumdlogdiv_b_den Horner step: add coefficient_4
    let t808 = circuit_mul(t807, in2); // Eval sumdlogdiv_b_den Horner step: multiply by xA2
    let t809 = circuit_add(in161, t808); // Eval sumdlogdiv_b_den Horner step: add coefficient_3
    let t810 = circuit_mul(t809, in2); // Eval sumdlogdiv_b_den Horner step: multiply by xA2
    let t811 = circuit_add(in160, t810); // Eval sumdlogdiv_b_den Horner step: add coefficient_2
    let t812 = circuit_mul(t811, in2); // Eval sumdlogdiv_b_den Horner step: multiply by xA2
    let t813 = circuit_add(in159, t812); // Eval sumdlogdiv_b_den Horner step: add coefficient_1
    let t814 = circuit_mul(t813, in2); // Eval sumdlogdiv_b_den Horner step: multiply by xA2
    let t815 = circuit_add(in158, t814); // Eval sumdlogdiv_b_den Horner step: add coefficient_0
    let t816 = circuit_inverse(t815);
    let t817 = circuit_mul(t709, t816);
    let t818 = circuit_mul(in3, t817);
    let t819 = circuit_add(t609, t818);
    let t820 = circuit_mul(in4, t409);
    let t821 = circuit_mul(in5, t819);
    let t822 = circuit_sub(t820, t821);

    let modulus = get_BN254_modulus(); // BN254 prime field modulus

    let mut circuit_inputs = (t822,).new_inputs();
    // Prefill constants:

    // Fill inputs:
    circuit_inputs = circuit_inputs.next_2(A0.x); // in0
    circuit_inputs = circuit_inputs.next_2(A0.y); // in1
    circuit_inputs = circuit_inputs.next_2(A2.x); // in2
    circuit_inputs = circuit_inputs.next_2(A2.y); // in3
    circuit_inputs = circuit_inputs.next_2(coeff0); // in4
    circuit_inputs = circuit_inputs.next_2(coeff2); // in5
    let mut SumDlogDivBatched_a_num = SumDlogDivBatched.a_num;
    while let Option::Some(val) = SumDlogDivBatched_a_num.pop_front() {
        circuit_inputs = circuit_inputs.next_2(*val);
    };
    let mut SumDlogDivBatched_a_den = SumDlogDivBatched.a_den;
    while let Option::Some(val) = SumDlogDivBatched_a_den.pop_front() {
        circuit_inputs = circuit_inputs.next_2(*val);
    };
    let mut SumDlogDivBatched_b_num = SumDlogDivBatched.b_num;
    while let Option::Some(val) = SumDlogDivBatched_b_num.pop_front() {
        circuit_inputs = circuit_inputs.next_2(*val);
    };
    let mut SumDlogDivBatched_b_den = SumDlogDivBatched.b_den;
    while let Option::Some(val) = SumDlogDivBatched_b_den.pop_front() {
        circuit_inputs = circuit_inputs.next_2(*val);
    };
    // in6 - in211

    let outputs = circuit_inputs.done_2().eval(modulus).unwrap();
    let res: u384 = outputs.get_output(t822);
    return (res,);
}
