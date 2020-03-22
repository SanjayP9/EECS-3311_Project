/*
 * Code for class ETF_TYPE_CONSTRAINTS
 */

#include "eif_eiffel.h"
#include "../E1/estructure.h"


#ifdef __cplusplus
extern "C" {
#endif

extern EIF_TYPED_VALUE F1088_9410(EIF_REFERENCE, EIF_TYPED_VALUE);
extern EIF_TYPED_VALUE F1088_9411(EIF_REFERENCE, EIF_TYPED_VALUE);
extern EIF_TYPED_VALUE F1088_9412(EIF_REFERENCE);
extern EIF_TYPED_VALUE F1088_9413(EIF_REFERENCE);
extern EIF_TYPED_VALUE F1088_9414(EIF_REFERENCE);
extern EIF_TYPED_VALUE F1088_9415(EIF_REFERENCE);
extern EIF_TYPED_VALUE F1088_9416(EIF_REFERENCE);
extern EIF_TYPED_VALUE F1088_9417(EIF_REFERENCE);
extern EIF_TYPED_VALUE F1088_9418(EIF_REFERENCE);
extern EIF_TYPED_VALUE F1088_9419(EIF_REFERENCE);
extern EIF_TYPED_VALUE F1088_9420(EIF_REFERENCE);
extern EIF_TYPED_VALUE F1088_9421(EIF_REFERENCE);
extern EIF_TYPED_VALUE F1088_9422(EIF_REFERENCE);
extern EIF_TYPED_VALUE F1088_9423(EIF_REFERENCE);
extern EIF_TYPED_VALUE F1088_9424(EIF_REFERENCE, EIF_TYPED_VALUE);
extern void EIF_Minit1088(void);

#ifdef __cplusplus
}
#endif


#ifdef __cplusplus
extern "C" {
#endif


#ifdef __cplusplus
}
#endif


#ifdef __cplusplus
extern "C" {
#endif

/* {ETF_TYPE_CONSTRAINTS}.is_direction */
EIF_TYPED_VALUE F1088_9410 (EIF_REFERENCE Current, EIF_TYPED_VALUE arg1x)
{
	GTCX
	char *l_feature_name = "is_direction";
	RTEX;
#define arg1 arg1x.it_i4
	EIF_TYPED_VALUE ur1x = {{0}, SK_REF};
#define ur1 ur1x.it_r
	EIF_REFERENCE tr1 = NULL;
	EIF_INTEGER_32 ti4_1;
	EIF_INTEGER_32 ti4_2;
	EIF_INTEGER_32 ti4_3;
	EIF_INTEGER_32 ti4_4;
	EIF_INTEGER_32 ti4_5;
	EIF_INTEGER_32 ti4_6;
	EIF_INTEGER_32 ti4_7;
	EIF_INTEGER_32 ti4_8;
	EIF_BOOLEAN tb1;
	EIF_BOOLEAN Result = ((EIF_BOOLEAN) 0);
	
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	if ((arg1x.type & SK_HEAD) == SK_REF) arg1x.it_i4 = * (EIF_INTEGER_32 *) arg1x.it_r;
	
	RTLI(3);
	RTLR(0,tr1);
	RTLR(1,ur1);
	RTLR(2,Current);
	RTLIU(3);
	RTLU (SK_BOOL, &Result);
	RTLU(SK_INT32,&arg1);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 1087, Current, 0, 1, 15666);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(1087, Current, 15666);
	RTIV(Current, RTAL);
	if ((RTAL & CK_REQUIRE) || RTAC) {
		RTHOOK(1);
		RTCT("comment(\"etf_v: DIRECTION = {N, NE, E, SE, S, SW, W, NW}\")", EX_PRE);
		tr1 = RTMS_EX_H("etf_v: DIRECTION = {N, NE, E, SE, S, SW, W, NW}",47,1622961533);
		ur1 = tr1;
		tb1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(7145, dtype))(Current, ur1x)).it_b);
		RTTE(tb1, label_1);
		RTCK;
		RTJB;
label_1:
		RTCF;
	}
body:;
	RTHOOK(2);
	RTDBGAL(0, 0x04000000, 1,0); /* Result */
	ti4_1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(7133, dtype))(Current)).it_i4);
	ti4_2 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(7134, dtype))(Current)).it_i4);
	ti4_3 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(7135, dtype))(Current)).it_i4);
	ti4_4 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(7136, dtype))(Current)).it_i4);
	ti4_5 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(7137, dtype))(Current)).it_i4);
	ti4_6 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(7138, dtype))(Current)).it_i4);
	ti4_7 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(7139, dtype))(Current)).it_i4);
	ti4_8 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(7140, dtype))(Current)).it_i4);
	Result = (EIF_BOOLEAN) ((EIF_BOOLEAN) ((EIF_BOOLEAN) ((EIF_BOOLEAN) ((EIF_BOOLEAN) ((EIF_BOOLEAN) ((EIF_BOOLEAN) ((EIF_BOOLEAN) ((arg1 == ti4_1) || (arg1 == ti4_2)) || (arg1 == ti4_3)) || (arg1 == ti4_4)) || (arg1 == ti4_5)) || (arg1 == ti4_6)) || (arg1 == ti4_7)) || (arg1 == ti4_8)));
	if (RTAL & CK_ENSURE) {
		RTHOOK(3);
		RTCT("Result = (( etf_v ~ N ) or else ( etf_v ~ NE ) or else ( etf_v ~ E ) or else ( etf_v ~ SE ) or else ( etf_v ~ S ) or else ( etf_v ~ SW ) or else ( etf_v ~ W ) or else ( etf_v ~ NW ))", EX_POST);
		ti4_1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(7133, dtype))(Current)).it_i4);
		ti4_2 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(7134, dtype))(Current)).it_i4);
		ti4_3 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(7135, dtype))(Current)).it_i4);
		ti4_4 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(7136, dtype))(Current)).it_i4);
		ti4_5 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(7137, dtype))(Current)).it_i4);
		ti4_6 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(7138, dtype))(Current)).it_i4);
		ti4_7 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(7139, dtype))(Current)).it_i4);
		ti4_8 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(7140, dtype))(Current)).it_i4);
		if ((EIF_BOOLEAN)(Result == ((EIF_BOOLEAN) ((EIF_BOOLEAN) ((EIF_BOOLEAN) ((EIF_BOOLEAN) ((EIF_BOOLEAN) ((EIF_BOOLEAN) ((EIF_BOOLEAN) ((arg1 == ti4_1) || (arg1 == ti4_2)) || (arg1 == ti4_3)) || (arg1 == ti4_4)) || (arg1 == ti4_5)) || (arg1 == ti4_6)) || (arg1 == ti4_7)) || (arg1 == ti4_8))))) {
			RTCK;
		} else {
			RTCF;
		}
	}
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(4);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(3);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_BOOL; r.it_b = Result; return r; }
#undef ur1
#undef arg1
}

/* {ETF_TYPE_CONSTRAINTS}.is_threshold */
EIF_TYPED_VALUE F1088_9411 (EIF_REFERENCE Current, EIF_TYPED_VALUE arg1x)
{
	GTCX
	char *l_feature_name = "is_threshold";
	RTEX;
#define arg1 arg1x.it_i4
	EIF_TYPED_VALUE ur1x = {{0}, SK_REF};
#define ur1 ur1x.it_r
	EIF_REFERENCE tr1 = NULL;
	EIF_BOOLEAN tb1;
	EIF_BOOLEAN Result = ((EIF_BOOLEAN) 0);
	
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	if ((arg1x.type & SK_HEAD) == SK_REF) arg1x.it_i4 = * (EIF_INTEGER_32 *) arg1x.it_r;
	
	RTLI(3);
	RTLR(0,tr1);
	RTLR(1,ur1);
	RTLR(2,Current);
	RTLIU(3);
	RTLU (SK_BOOL, &Result);
	RTLU(SK_INT32,&arg1);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 1087, Current, 0, 1, 15667);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(1087, Current, 15667);
	RTIV(Current, RTAL);
	if ((RTAL & CK_REQUIRE) || RTAC) {
		RTHOOK(1);
		RTCT("comment(\"etf_v: THRESHOLD = 1 .. 101\")", EX_PRE);
		tr1 = RTMS_EX_H("etf_v: THRESHOLD = 1 .. 101",27,787488049);
		ur1 = tr1;
		tb1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(7145, dtype))(Current, ur1x)).it_b);
		RTTE(tb1, label_1);
		RTCK;
		RTJB;
label_1:
		RTCF;
	}
body:;
	RTHOOK(2);
	RTDBGAL(0, 0x04000000, 1,0); /* Result */
	Result = (EIF_BOOLEAN) (EIF_BOOLEAN) ((EIF_BOOLEAN) (((EIF_INTEGER_32) 1L) <= arg1) && (EIF_BOOLEAN) (arg1 <= ((EIF_INTEGER_32) 101L)));
	if (RTAL & CK_ENSURE) {
		RTHOOK(3);
		RTCT("Result = (1 <= etf_v) and then (etf_v <= 101)", EX_POST);
		if ((EIF_BOOLEAN) ((EIF_BOOLEAN)(Result == (EIF_BOOLEAN) (((EIF_INTEGER_32) 1L) <= arg1)) && (EIF_BOOLEAN) (arg1 <= ((EIF_INTEGER_32) 101L)))) {
			RTCK;
		} else {
			RTCF;
		}
	}
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(4);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(3);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_BOOL; r.it_b = Result; return r; }
#undef ur1
#undef arg1
}

/* {ETF_TYPE_CONSTRAINTS}.n */
EIF_TYPED_VALUE F1088_9412 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_INT32;
	r.it_i4 = (EIF_INTEGER_32) ((EIF_INTEGER_32) 1L);
	return r;
}

/* {ETF_TYPE_CONSTRAINTS}.ne */
EIF_TYPED_VALUE F1088_9413 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_INT32;
	r.it_i4 = (EIF_INTEGER_32) ((EIF_INTEGER_32) 2L);
	return r;
}

/* {ETF_TYPE_CONSTRAINTS}.e */
EIF_TYPED_VALUE F1088_9414 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_INT32;
	r.it_i4 = (EIF_INTEGER_32) ((EIF_INTEGER_32) 3L);
	return r;
}

/* {ETF_TYPE_CONSTRAINTS}.se */
EIF_TYPED_VALUE F1088_9415 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_INT32;
	r.it_i4 = (EIF_INTEGER_32) ((EIF_INTEGER_32) 4L);
	return r;
}

/* {ETF_TYPE_CONSTRAINTS}.s */
EIF_TYPED_VALUE F1088_9416 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_INT32;
	r.it_i4 = (EIF_INTEGER_32) ((EIF_INTEGER_32) 5L);
	return r;
}

/* {ETF_TYPE_CONSTRAINTS}.sw */
EIF_TYPED_VALUE F1088_9417 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_INT32;
	r.it_i4 = (EIF_INTEGER_32) ((EIF_INTEGER_32) 6L);
	return r;
}

/* {ETF_TYPE_CONSTRAINTS}.w */
EIF_TYPED_VALUE F1088_9418 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_INT32;
	r.it_i4 = (EIF_INTEGER_32) ((EIF_INTEGER_32) 7L);
	return r;
}

/* {ETF_TYPE_CONSTRAINTS}.nw */
EIF_TYPED_VALUE F1088_9419 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_INT32;
	r.it_i4 = (EIF_INTEGER_32) ((EIF_INTEGER_32) 8L);
	return r;
}

/* {ETF_TYPE_CONSTRAINTS}.enum_items */
EIF_TYPED_VALUE F1088_9420 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "enum_items";
	RTEX;
	EIF_TYPED_VALUE ur1x = {{0}, SK_REF};
#define ur1 ur1x.it_r
	EIF_TYPED_VALUE ui4_1x = {{0}, SK_INT32};
#define ui4_1 ui4_1x.it_i4
	EIF_REFERENCE tr1 = NULL;
	EIF_REFERENCE Result = ((EIF_REFERENCE) 0);
	
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(4);
	RTLR(0,Current);
	RTLR(1,tr1);
	RTLR(2,Result);
	RTLR(3,ur1);
	RTLIU(4);
	RTLU (SK_REF, &Result);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 1087, Current, 0, 0, 15676);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(1087, Current, 15676);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAL(0, 0xF800035F, 0,0); /* Result */
	{
		static EIF_TYPE_INDEX typarr0[] = {0xFF01,863,221,0xFF01,232,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(Dftype(Current), typarr0)));
		tr1 = RTLN(typres0.id);
	}
	ui4_1 = ((EIF_INTEGER_32) 10L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(2970, Dtype(tr1)))(tr1, ui4_1x);
	RTNHOOK(1,1);
	Result = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(2);
	ui4_1 = ((EIF_INTEGER_32) 1L);
	tr1 = RTMS_EX_H("N",1,78);
	ur1 = tr1;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3002, "extend", Result))(Result, ui4_1x, ur1x);
	RTHOOK(3);
	ui4_1 = ((EIF_INTEGER_32) 2L);
	tr1 = RTMS_EX_H("NE",2,20037);
	ur1 = tr1;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3002, "extend", Result))(Result, ui4_1x, ur1x);
	RTHOOK(4);
	ui4_1 = ((EIF_INTEGER_32) 3L);
	tr1 = RTMS_EX_H("E",1,69);
	ur1 = tr1;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3002, "extend", Result))(Result, ui4_1x, ur1x);
	RTHOOK(5);
	ui4_1 = ((EIF_INTEGER_32) 4L);
	tr1 = RTMS_EX_H("SE",2,21317);
	ur1 = tr1;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3002, "extend", Result))(Result, ui4_1x, ur1x);
	RTHOOK(6);
	ui4_1 = ((EIF_INTEGER_32) 5L);
	tr1 = RTMS_EX_H("S",1,83);
	ur1 = tr1;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3002, "extend", Result))(Result, ui4_1x, ur1x);
	RTHOOK(7);
	ui4_1 = ((EIF_INTEGER_32) 6L);
	tr1 = RTMS_EX_H("SW",2,21335);
	ur1 = tr1;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3002, "extend", Result))(Result, ui4_1x, ur1x);
	RTHOOK(8);
	ui4_1 = ((EIF_INTEGER_32) 7L);
	tr1 = RTMS_EX_H("W",1,87);
	ur1 = tr1;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3002, "extend", Result))(Result, ui4_1x, ur1x);
	RTHOOK(9);
	ui4_1 = ((EIF_INTEGER_32) 8L);
	tr1 = RTMS_EX_H("NW",2,20055);
	ur1 = tr1;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3002, "extend", Result))(Result, ui4_1x, ur1x);
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(10);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_REF; r.it_r = Result; return r; }
#undef ur1
#undef ui4_1
}

/* {ETF_TYPE_CONSTRAINTS}.enum_items_inverse */
EIF_TYPED_VALUE F1088_9421 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "enum_items_inverse";
	RTEX;
	EIF_TYPED_VALUE ur1x = {{0}, SK_REF};
#define ur1 ur1x.it_r
	EIF_TYPED_VALUE ui4_1x = {{0}, SK_INT32};
#define ui4_1 ui4_1x.it_i4
	EIF_REFERENCE tr1 = NULL;
	EIF_REFERENCE Result = ((EIF_REFERENCE) 0);
	
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(4);
	RTLR(0,Current);
	RTLR(1,tr1);
	RTLR(2,Result);
	RTLR(3,ur1);
	RTLIU(4);
	RTLU (SK_REF, &Result);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 1087, Current, 0, 0, 15677);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(1087, Current, 15677);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAL(0, 0xF800029F, 0,0); /* Result */
	{
		static EIF_TYPE_INDEX typarr0[] = {0xFF01,671,0xFF01,232,221,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(Dftype(Current), typarr0)));
		tr1 = RTLN(typres0.id);
	}
	ui4_1 = ((EIF_INTEGER_32) 10L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(2970, Dtype(tr1)))(tr1, ui4_1x);
	RTNHOOK(1,1);
	Result = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(2);
	tr1 = RTMS_EX_H("N",1,78);
	ur1 = tr1;
	ui4_1 = ((EIF_INTEGER_32) 1L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3002, "extend", Result))(Result, ur1x, ui4_1x);
	RTHOOK(3);
	tr1 = RTMS_EX_H("NE",2,20037);
	ur1 = tr1;
	ui4_1 = ((EIF_INTEGER_32) 2L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3002, "extend", Result))(Result, ur1x, ui4_1x);
	RTHOOK(4);
	tr1 = RTMS_EX_H("E",1,69);
	ur1 = tr1;
	ui4_1 = ((EIF_INTEGER_32) 3L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3002, "extend", Result))(Result, ur1x, ui4_1x);
	RTHOOK(5);
	tr1 = RTMS_EX_H("SE",2,21317);
	ur1 = tr1;
	ui4_1 = ((EIF_INTEGER_32) 4L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3002, "extend", Result))(Result, ur1x, ui4_1x);
	RTHOOK(6);
	tr1 = RTMS_EX_H("S",1,83);
	ur1 = tr1;
	ui4_1 = ((EIF_INTEGER_32) 5L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3002, "extend", Result))(Result, ur1x, ui4_1x);
	RTHOOK(7);
	tr1 = RTMS_EX_H("SW",2,21335);
	ur1 = tr1;
	ui4_1 = ((EIF_INTEGER_32) 6L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3002, "extend", Result))(Result, ur1x, ui4_1x);
	RTHOOK(8);
	tr1 = RTMS_EX_H("W",1,87);
	ur1 = tr1;
	ui4_1 = ((EIF_INTEGER_32) 7L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3002, "extend", Result))(Result, ur1x, ui4_1x);
	RTHOOK(9);
	tr1 = RTMS_EX_H("NW",2,20055);
	ur1 = tr1;
	ui4_1 = ((EIF_INTEGER_32) 8L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3002, "extend", Result))(Result, ur1x, ui4_1x);
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(10);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_REF; r.it_r = Result; return r; }
#undef ur1
#undef ui4_1
}

/* {ETF_TYPE_CONSTRAINTS}.evt_param_types_table */
EIF_TYPED_VALUE F1088_9422 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "evt_param_types_table";
	RTEX;
	EIF_REFERENCE loc1 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc2 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc3 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc4 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc5 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc6 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc7 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc8 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc9 = (EIF_REFERENCE) 0;
	EIF_TYPED_VALUE ur1x = {{0}, SK_REF};
#define ur1 ur1x.it_r
	EIF_TYPED_VALUE ur2x = {{0}, SK_REF};
#define ur2 ur2x.it_r
	EIF_TYPED_VALUE ui4_1x = {{0}, SK_INT32};
#define ui4_1 ui4_1x.it_i4
	EIF_TYPED_VALUE ui4_2x = {{0}, SK_INT32};
#define ui4_2 ui4_2x.it_i4
	EIF_REFERENCE tr1 = NULL;
	EIF_REFERENCE tr2 = NULL;
	EIF_REFERENCE tr3 = NULL;
	EIF_REFERENCE tr4 = NULL;
	EIF_REFERENCE tr5 = NULL;
	EIF_REFERENCE tr6 = NULL;
	EIF_REFERENCE Result = ((EIF_REFERENCE) 0);
	
	RTCFDT;
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(19);
	RTLR(0,Current);
	RTLR(1,tr1);
	RTLR(2,Result);
	RTLR(3,loc1);
	RTLR(4,tr2);
	RTLR(5,ur1);
	RTLR(6,tr3);
	RTLR(7,ur2);
	RTLR(8,loc2);
	RTLR(9,loc3);
	RTLR(10,loc4);
	RTLR(11,tr4);
	RTLR(12,tr5);
	RTLR(13,tr6);
	RTLR(14,loc5);
	RTLR(15,loc6);
	RTLR(16,loc7);
	RTLR(17,loc8);
	RTLR(18,loc9);
	RTLIU(19);
	RTLU (SK_REF, &Result);
	RTLU (SK_REF, &Current);
	RTLU(SK_REF, &loc1);
	RTLU(SK_REF, &loc2);
	RTLU(SK_REF, &loc3);
	RTLU(SK_REF, &loc4);
	RTLU(SK_REF, &loc5);
	RTLU(SK_REF, &loc6);
	RTLU(SK_REF, &loc7);
	RTLU(SK_REF, &loc8);
	RTLU(SK_REF, &loc9);
	
	RTEAA(l_feature_name, 1087, Current, 9, 0, 15678);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(1087, Current, 15678);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAL(0, 0xF800029C, 0,0); /* Result */
	{
		static EIF_TYPE_INDEX typarr0[] = {0xFF01,668,0xFF01,668,0xFF01,1072,0xFF01,232,0xFF01,232,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
		tr1 = RTLN(typres0.id);
	}
	ui4_1 = ((EIF_INTEGER_32) 10L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(2970, Dtype(tr1)))(tr1, ui4_1x);
	RTNHOOK(1,1);
	Result = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(2);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(2331, "compare_objects", Result))(Result);
	RTHOOK(3);
	RTDBGAL(1, 0xF800029C, 0, 0); /* loc1 */
	{
		static EIF_TYPE_INDEX typarr0[] = {0xFF01,668,0xFF01,1072,0xFF01,232,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
		tr1 = RTLN(typres0.id);
	}
	ui4_1 = ((EIF_INTEGER_32) 10L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(2970, Dtype(tr1)))(tr1, ui4_1x);
	RTNHOOK(3,1);
	loc1 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(4);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(2331, "compare_objects", loc1))(loc1);
	RTHOOK(5);
	tr1 = RTLN(eif_new_type(1084, 0x01).id);
	tr2 = RTMS_EX_H("THRESHOLD",9,347959364);
	ur1 = tr2;
	tr3 = RTLN(eif_new_type(1081, 0x01).id);
	ui4_1 = ((EIF_INTEGER_32) 1L);
	ui4_2 = ((EIF_INTEGER_32) 101L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(7125, Dtype(tr3)))(tr3, ui4_1x, ui4_2x);
	RTNHOOK(5,1);
	ur2 = RTCCL(tr3);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(7128, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(5,2);
	ur1 = RTCCL(tr1);
	tr2 = RTMS_EX_H("a_threshold",11,229634916);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3002, "extend", loc1))(loc1, ur1x, ur2x);
	RTHOOK(6);
	tr1 = RTLN(eif_new_type(1084, 0x01).id);
	tr2 = RTMS_EX_H("THRESHOLD",9,347959364);
	ur1 = tr2;
	tr3 = RTLN(eif_new_type(1081, 0x01).id);
	ui4_1 = ((EIF_INTEGER_32) 1L);
	ui4_2 = ((EIF_INTEGER_32) 101L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(7125, Dtype(tr3)))(tr3, ui4_1x, ui4_2x);
	RTNHOOK(6,1);
	ur2 = RTCCL(tr3);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(7128, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(6,2);
	ur1 = RTCCL(tr1);
	tr2 = RTMS_EX_H("j_threshold",11,291842916);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3002, "extend", loc1))(loc1, ur1x, ur2x);
	RTHOOK(7);
	tr1 = RTLN(eif_new_type(1084, 0x01).id);
	tr2 = RTMS_EX_H("THRESHOLD",9,347959364);
	ur1 = tr2;
	tr3 = RTLN(eif_new_type(1081, 0x01).id);
	ui4_1 = ((EIF_INTEGER_32) 1L);
	ui4_2 = ((EIF_INTEGER_32) 101L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(7125, Dtype(tr3)))(tr3, ui4_1x, ui4_2x);
	RTNHOOK(7,1);
	ur2 = RTCCL(tr3);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(7128, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(7,2);
	ur1 = RTCCL(tr1);
	tr2 = RTMS_EX_H("m_threshold",11,312578916);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3002, "extend", loc1))(loc1, ur1x, ur2x);
	RTHOOK(8);
	tr1 = RTLN(eif_new_type(1084, 0x01).id);
	tr2 = RTMS_EX_H("THRESHOLD",9,347959364);
	ur1 = tr2;
	tr3 = RTLN(eif_new_type(1081, 0x01).id);
	ui4_1 = ((EIF_INTEGER_32) 1L);
	ui4_2 = ((EIF_INTEGER_32) 101L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(7125, Dtype(tr3)))(tr3, ui4_1x, ui4_2x);
	RTNHOOK(8,1);
	ur2 = RTCCL(tr3);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(7128, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(8,2);
	ur1 = RTCCL(tr1);
	tr2 = RTMS_EX_H("b_threshold",11,236546916);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3002, "extend", loc1))(loc1, ur1x, ur2x);
	RTHOOK(9);
	tr1 = RTLN(eif_new_type(1084, 0x01).id);
	tr2 = RTMS_EX_H("THRESHOLD",9,347959364);
	ur1 = tr2;
	tr3 = RTLN(eif_new_type(1081, 0x01).id);
	ui4_1 = ((EIF_INTEGER_32) 1L);
	ui4_2 = ((EIF_INTEGER_32) 101L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(7125, Dtype(tr3)))(tr3, ui4_1x, ui4_2x);
	RTNHOOK(9,1);
	ur2 = RTCCL(tr3);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(7128, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(9,2);
	ur1 = RTCCL(tr1);
	tr2 = RTMS_EX_H("p_threshold",11,333314916);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3002, "extend", loc1))(loc1, ur1x, ur2x);
	RTHOOK(10);
	ur1 = RTCCL(loc1);
	tr1 = RTMS_EX_H("test",4,1952805748);
	ur2 = tr1;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3002, "extend", Result))(Result, ur1x, ur2x);
	RTHOOK(11);
	RTDBGAL(2, 0xF800029C, 0, 0); /* loc2 */
	{
		static EIF_TYPE_INDEX typarr0[] = {0xFF01,668,0xFF01,1072,0xFF01,232,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
		tr1 = RTLN(typres0.id);
	}
	ui4_1 = ((EIF_INTEGER_32) 10L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(2970, Dtype(tr1)))(tr1, ui4_1x);
	RTNHOOK(11,1);
	loc2 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(12);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(2331, "compare_objects", loc2))(loc2);
	RTHOOK(13);
	ur1 = RTCCL(loc2);
	tr1 = RTMS_EX_H("play",4,1886151033);
	ur2 = tr1;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3002, "extend", Result))(Result, ur1x, ur2x);
	RTHOOK(14);
	RTDBGAL(3, 0xF800029C, 0, 0); /* loc3 */
	{
		static EIF_TYPE_INDEX typarr0[] = {0xFF01,668,0xFF01,1072,0xFF01,232,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
		tr1 = RTLN(typres0.id);
	}
	ui4_1 = ((EIF_INTEGER_32) 10L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(2970, Dtype(tr1)))(tr1, ui4_1x);
	RTNHOOK(14,1);
	loc3 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(15);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(2331, "compare_objects", loc3))(loc3);
	RTHOOK(16);
	ur1 = RTCCL(loc3);
	tr1 = RTMS_EX_H("abort",5,1652215924);
	ur2 = tr1;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3002, "extend", Result))(Result, ur1x, ur2x);
	RTHOOK(17);
	RTDBGAL(4, 0xF800029C, 0, 0); /* loc4 */
	{
		static EIF_TYPE_INDEX typarr0[] = {0xFF01,668,0xFF01,1072,0xFF01,232,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
		tr1 = RTLN(typres0.id);
	}
	ui4_1 = ((EIF_INTEGER_32) 10L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(2970, Dtype(tr1)))(tr1, ui4_1x);
	RTNHOOK(17,1);
	loc4 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(18);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(2331, "compare_objects", loc4))(loc4);
	RTHOOK(19);
	tr1 = RTLN(eif_new_type(1084, 0x01).id);
	tr2 = RTMS_EX_H("DIRECTION",9,1752762446);
	ur1 = tr2;
	tr3 = RTLN(eif_new_type(1076, 0x01).id);
	ui4_1 = ((EIF_INTEGER_32) 8L);
	{
		static EIF_TYPE_INDEX typarr0[] = {356,0xFF01,232,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
		tr5 = RTLNSP2(typres0.id,EO_REF,ui4_1,sizeof(EIF_REFERENCE), EIF_FALSE);
		RT_SPECIAL_COUNT(tr5) = 8L;
		memset(tr5, 0, RT_SPECIAL_VISIBLE_SIZE(tr5));
	}
	tr6 = RTMS_EX_H("N",1,78);
	*((EIF_REFERENCE *)tr5+0) = (EIF_REFERENCE) tr6;
	RTAR(tr5,tr6);
	tr6 = RTMS_EX_H("NE",2,20037);
	*((EIF_REFERENCE *)tr5+1) = (EIF_REFERENCE) tr6;
	RTAR(tr5,tr6);
	tr6 = RTMS_EX_H("E",1,69);
	*((EIF_REFERENCE *)tr5+2) = (EIF_REFERENCE) tr6;
	RTAR(tr5,tr6);
	tr6 = RTMS_EX_H("SE",2,21317);
	*((EIF_REFERENCE *)tr5+3) = (EIF_REFERENCE) tr6;
	RTAR(tr5,tr6);
	tr6 = RTMS_EX_H("S",1,83);
	*((EIF_REFERENCE *)tr5+4) = (EIF_REFERENCE) tr6;
	RTAR(tr5,tr6);
	tr6 = RTMS_EX_H("SW",2,21335);
	*((EIF_REFERENCE *)tr5+5) = (EIF_REFERENCE) tr6;
	RTAR(tr5,tr6);
	tr6 = RTMS_EX_H("W",1,87);
	*((EIF_REFERENCE *)tr5+6) = (EIF_REFERENCE) tr6;
	RTAR(tr5,tr6);
	tr6 = RTMS_EX_H("NW",2,20055);
	*((EIF_REFERENCE *)tr5+7) = (EIF_REFERENCE) tr6;
	RTAR(tr5,tr6);
	tr4 = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE))  RTWF(2686, Dtype(tr5)))(tr5).it_r;
	ur2 = tr4;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(7121, Dtype(tr3)))(tr3, ur2x);
	RTNHOOK(19,1);
	ur2 = RTCCL(tr3);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(7128, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(19,2);
	ur1 = RTCCL(tr1);
	tr2 = RTMS_EX_H("dir",3,6580594);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3002, "extend", loc4))(loc4, ur1x, ur2x);
	RTHOOK(20);
	ur1 = RTCCL(loc4);
	tr1 = RTMS_EX_H("move",4,1836021349);
	ur2 = tr1;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3002, "extend", Result))(Result, ur1x, ur2x);
	RTHOOK(21);
	RTDBGAL(5, 0xF800029C, 0, 0); /* loc5 */
	{
		static EIF_TYPE_INDEX typarr0[] = {0xFF01,668,0xFF01,1072,0xFF01,232,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
		tr1 = RTLN(typres0.id);
	}
	ui4_1 = ((EIF_INTEGER_32) 10L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(2970, Dtype(tr1)))(tr1, ui4_1x);
	RTNHOOK(21,1);
	loc5 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(22);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(2331, "compare_objects", loc5))(loc5);
	RTHOOK(23);
	ur1 = RTCCL(loc5);
	tr1 = RTMS_EX_H("land",4,1818324580);
	ur2 = tr1;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3002, "extend", Result))(Result, ur1x, ur2x);
	RTHOOK(24);
	RTDBGAL(6, 0xF800029C, 0, 0); /* loc6 */
	{
		static EIF_TYPE_INDEX typarr0[] = {0xFF01,668,0xFF01,1072,0xFF01,232,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
		tr1 = RTLN(typres0.id);
	}
	ui4_1 = ((EIF_INTEGER_32) 10L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(2970, Dtype(tr1)))(tr1, ui4_1x);
	RTNHOOK(24,1);
	loc6 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(25);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(2331, "compare_objects", loc6))(loc6);
	RTHOOK(26);
	ur1 = RTCCL(loc6);
	tr1 = RTMS_EX_H("liftoff",7,684384358);
	ur2 = tr1;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3002, "extend", Result))(Result, ur1x, ur2x);
	RTHOOK(27);
	RTDBGAL(7, 0xF800029C, 0, 0); /* loc7 */
	{
		static EIF_TYPE_INDEX typarr0[] = {0xFF01,668,0xFF01,1072,0xFF01,232,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
		tr1 = RTLN(typres0.id);
	}
	ui4_1 = ((EIF_INTEGER_32) 10L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(2970, Dtype(tr1)))(tr1, ui4_1x);
	RTNHOOK(27,1);
	loc7 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(28);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(2331, "compare_objects", loc7))(loc7);
	RTHOOK(29);
	ur1 = RTCCL(loc7);
	tr1 = RTMS_EX_H("pass",4,1885434739);
	ur2 = tr1;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3002, "extend", Result))(Result, ur1x, ur2x);
	RTHOOK(30);
	RTDBGAL(8, 0xF800029C, 0, 0); /* loc8 */
	{
		static EIF_TYPE_INDEX typarr0[] = {0xFF01,668,0xFF01,1072,0xFF01,232,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
		tr1 = RTLN(typres0.id);
	}
	ui4_1 = ((EIF_INTEGER_32) 10L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(2970, Dtype(tr1)))(tr1, ui4_1x);
	RTNHOOK(30,1);
	loc8 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(31);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(2331, "compare_objects", loc8))(loc8);
	RTHOOK(32);
	ur1 = RTCCL(loc8);
	tr1 = RTMS_EX_H("wormhole",8,2038174821);
	ur2 = tr1;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3002, "extend", Result))(Result, ur1x, ur2x);
	RTHOOK(33);
	RTDBGAL(9, 0xF800029C, 0, 0); /* loc9 */
	{
		static EIF_TYPE_INDEX typarr0[] = {0xFF01,668,0xFF01,1072,0xFF01,232,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
		tr1 = RTLN(typres0.id);
	}
	ui4_1 = ((EIF_INTEGER_32) 10L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(2970, Dtype(tr1)))(tr1, ui4_1x);
	RTNHOOK(33,1);
	loc9 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(34);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(2331, "compare_objects", loc9))(loc9);
	RTHOOK(35);
	ur1 = RTCCL(loc9);
	tr1 = RTMS_EX_H("status",6,1862012275);
	ur2 = tr1;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3002, "extend", Result))(Result, ur1x, ur2x);
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(36);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(11);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_REF; r.it_r = Result; return r; }
#undef ur1
#undef ur2
#undef ui4_1
#undef ui4_2
}

/* {ETF_TYPE_CONSTRAINTS}.evt_param_types_list */
EIF_TYPED_VALUE F1088_9423 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "evt_param_types_list";
	RTEX;
	EIF_REFERENCE loc1 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc2 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc3 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc4 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc5 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc6 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc7 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc8 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc9 = (EIF_REFERENCE) 0;
	EIF_TYPED_VALUE ur1x = {{0}, SK_REF};
#define ur1 ur1x.it_r
	EIF_TYPED_VALUE ur2x = {{0}, SK_REF};
#define ur2 ur2x.it_r
	EIF_TYPED_VALUE ui4_1x = {{0}, SK_INT32};
#define ui4_1 ui4_1x.it_i4
	EIF_TYPED_VALUE ui4_2x = {{0}, SK_INT32};
#define ui4_2 ui4_2x.it_i4
	EIF_REFERENCE tr1 = NULL;
	EIF_REFERENCE tr2 = NULL;
	EIF_REFERENCE tr3 = NULL;
	EIF_REFERENCE tr4 = NULL;
	EIF_REFERENCE tr5 = NULL;
	EIF_REFERENCE tr6 = NULL;
	EIF_REFERENCE Result = ((EIF_REFERENCE) 0);
	
	RTCFDT;
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(19);
	RTLR(0,Current);
	RTLR(1,tr1);
	RTLR(2,Result);
	RTLR(3,loc1);
	RTLR(4,tr2);
	RTLR(5,ur1);
	RTLR(6,tr3);
	RTLR(7,ur2);
	RTLR(8,loc2);
	RTLR(9,loc3);
	RTLR(10,loc4);
	RTLR(11,tr4);
	RTLR(12,tr5);
	RTLR(13,tr6);
	RTLR(14,loc5);
	RTLR(15,loc6);
	RTLR(16,loc7);
	RTLR(17,loc8);
	RTLR(18,loc9);
	RTLIU(19);
	RTLU (SK_REF, &Result);
	RTLU (SK_REF, &Current);
	RTLU(SK_REF, &loc1);
	RTLU(SK_REF, &loc2);
	RTLU(SK_REF, &loc3);
	RTLU(SK_REF, &loc4);
	RTLU(SK_REF, &loc5);
	RTLU(SK_REF, &loc6);
	RTLU(SK_REF, &loc7);
	RTLU(SK_REF, &loc8);
	RTLU(SK_REF, &loc9);
	
	RTEAA(l_feature_name, 1087, Current, 9, 0, 15679);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(1087, Current, 15679);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAL(0, 0xF800029C, 0,0); /* Result */
	{
		static EIF_TYPE_INDEX typarr0[] = {0xFF01,668,0xFF01,631,0xFF01,1072,0xFF01,232,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
		tr1 = RTLN(typres0.id);
	}
	ui4_1 = ((EIF_INTEGER_32) 10L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(2970, Dtype(tr1)))(tr1, ui4_1x);
	RTNHOOK(1,1);
	Result = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(2);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(2331, "compare_objects", Result))(Result);
	RTHOOK(3);
	RTDBGAL(1, 0xF8000277, 0, 0); /* loc1 */
	{
		static EIF_TYPE_INDEX typarr0[] = {0xFF01,631,0xFF01,1072,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
		tr1 = RTLN(typres0.id);
	}
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(2880, Dtype(tr1)))(tr1);
	RTNHOOK(3,1);
	loc1 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(4);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(2331, "compare_objects", loc1))(loc1);
	RTHOOK(5);
	tr1 = RTLN(eif_new_type(1084, 0x01).id);
	tr2 = RTMS_EX_H("THRESHOLD",9,347959364);
	ur1 = tr2;
	tr3 = RTLN(eif_new_type(1081, 0x01).id);
	ui4_1 = ((EIF_INTEGER_32) 1L);
	ui4_2 = ((EIF_INTEGER_32) 101L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(7125, Dtype(tr3)))(tr3, ui4_1x, ui4_2x);
	RTNHOOK(5,1);
	ur2 = RTCCL(tr3);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(7128, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(5,2);
	ur1 = RTCCL(tr1);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(2339, "extend", loc1))(loc1, ur1x);
	RTHOOK(6);
	tr1 = RTLN(eif_new_type(1084, 0x01).id);
	tr2 = RTMS_EX_H("THRESHOLD",9,347959364);
	ur1 = tr2;
	tr3 = RTLN(eif_new_type(1081, 0x01).id);
	ui4_1 = ((EIF_INTEGER_32) 1L);
	ui4_2 = ((EIF_INTEGER_32) 101L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(7125, Dtype(tr3)))(tr3, ui4_1x, ui4_2x);
	RTNHOOK(6,1);
	ur2 = RTCCL(tr3);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(7128, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(6,2);
	ur1 = RTCCL(tr1);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(2339, "extend", loc1))(loc1, ur1x);
	RTHOOK(7);
	tr1 = RTLN(eif_new_type(1084, 0x01).id);
	tr2 = RTMS_EX_H("THRESHOLD",9,347959364);
	ur1 = tr2;
	tr3 = RTLN(eif_new_type(1081, 0x01).id);
	ui4_1 = ((EIF_INTEGER_32) 1L);
	ui4_2 = ((EIF_INTEGER_32) 101L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(7125, Dtype(tr3)))(tr3, ui4_1x, ui4_2x);
	RTNHOOK(7,1);
	ur2 = RTCCL(tr3);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(7128, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(7,2);
	ur1 = RTCCL(tr1);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(2339, "extend", loc1))(loc1, ur1x);
	RTHOOK(8);
	tr1 = RTLN(eif_new_type(1084, 0x01).id);
	tr2 = RTMS_EX_H("THRESHOLD",9,347959364);
	ur1 = tr2;
	tr3 = RTLN(eif_new_type(1081, 0x01).id);
	ui4_1 = ((EIF_INTEGER_32) 1L);
	ui4_2 = ((EIF_INTEGER_32) 101L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(7125, Dtype(tr3)))(tr3, ui4_1x, ui4_2x);
	RTNHOOK(8,1);
	ur2 = RTCCL(tr3);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(7128, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(8,2);
	ur1 = RTCCL(tr1);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(2339, "extend", loc1))(loc1, ur1x);
	RTHOOK(9);
	tr1 = RTLN(eif_new_type(1084, 0x01).id);
	tr2 = RTMS_EX_H("THRESHOLD",9,347959364);
	ur1 = tr2;
	tr3 = RTLN(eif_new_type(1081, 0x01).id);
	ui4_1 = ((EIF_INTEGER_32) 1L);
	ui4_2 = ((EIF_INTEGER_32) 101L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(7125, Dtype(tr3)))(tr3, ui4_1x, ui4_2x);
	RTNHOOK(9,1);
	ur2 = RTCCL(tr3);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(7128, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(9,2);
	ur1 = RTCCL(tr1);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(2339, "extend", loc1))(loc1, ur1x);
	RTHOOK(10);
	ur1 = RTCCL(loc1);
	tr1 = RTMS_EX_H("test",4,1952805748);
	ur2 = tr1;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3002, "extend", Result))(Result, ur1x, ur2x);
	RTHOOK(11);
	RTDBGAL(2, 0xF8000277, 0, 0); /* loc2 */
	{
		static EIF_TYPE_INDEX typarr0[] = {0xFF01,631,0xFF01,1072,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
		tr1 = RTLN(typres0.id);
	}
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(2880, Dtype(tr1)))(tr1);
	RTNHOOK(11,1);
	loc2 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(12);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(2331, "compare_objects", loc2))(loc2);
	RTHOOK(13);
	ur1 = RTCCL(loc2);
	tr1 = RTMS_EX_H("play",4,1886151033);
	ur2 = tr1;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3002, "extend", Result))(Result, ur1x, ur2x);
	RTHOOK(14);
	RTDBGAL(3, 0xF8000277, 0, 0); /* loc3 */
	{
		static EIF_TYPE_INDEX typarr0[] = {0xFF01,631,0xFF01,1072,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
		tr1 = RTLN(typres0.id);
	}
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(2880, Dtype(tr1)))(tr1);
	RTNHOOK(14,1);
	loc3 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(15);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(2331, "compare_objects", loc3))(loc3);
	RTHOOK(16);
	ur1 = RTCCL(loc3);
	tr1 = RTMS_EX_H("abort",5,1652215924);
	ur2 = tr1;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3002, "extend", Result))(Result, ur1x, ur2x);
	RTHOOK(17);
	RTDBGAL(4, 0xF8000277, 0, 0); /* loc4 */
	{
		static EIF_TYPE_INDEX typarr0[] = {0xFF01,631,0xFF01,1072,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
		tr1 = RTLN(typres0.id);
	}
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(2880, Dtype(tr1)))(tr1);
	RTNHOOK(17,1);
	loc4 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(18);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(2331, "compare_objects", loc4))(loc4);
	RTHOOK(19);
	tr1 = RTLN(eif_new_type(1084, 0x01).id);
	tr2 = RTMS_EX_H("DIRECTION",9,1752762446);
	ur1 = tr2;
	tr3 = RTLN(eif_new_type(1076, 0x01).id);
	ui4_1 = ((EIF_INTEGER_32) 8L);
	{
		static EIF_TYPE_INDEX typarr0[] = {356,0xFF01,232,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
		tr5 = RTLNSP2(typres0.id,EO_REF,ui4_1,sizeof(EIF_REFERENCE), EIF_FALSE);
		RT_SPECIAL_COUNT(tr5) = 8L;
		memset(tr5, 0, RT_SPECIAL_VISIBLE_SIZE(tr5));
	}
	tr6 = RTMS_EX_H("N",1,78);
	*((EIF_REFERENCE *)tr5+0) = (EIF_REFERENCE) tr6;
	RTAR(tr5,tr6);
	tr6 = RTMS_EX_H("NE",2,20037);
	*((EIF_REFERENCE *)tr5+1) = (EIF_REFERENCE) tr6;
	RTAR(tr5,tr6);
	tr6 = RTMS_EX_H("E",1,69);
	*((EIF_REFERENCE *)tr5+2) = (EIF_REFERENCE) tr6;
	RTAR(tr5,tr6);
	tr6 = RTMS_EX_H("SE",2,21317);
	*((EIF_REFERENCE *)tr5+3) = (EIF_REFERENCE) tr6;
	RTAR(tr5,tr6);
	tr6 = RTMS_EX_H("S",1,83);
	*((EIF_REFERENCE *)tr5+4) = (EIF_REFERENCE) tr6;
	RTAR(tr5,tr6);
	tr6 = RTMS_EX_H("SW",2,21335);
	*((EIF_REFERENCE *)tr5+5) = (EIF_REFERENCE) tr6;
	RTAR(tr5,tr6);
	tr6 = RTMS_EX_H("W",1,87);
	*((EIF_REFERENCE *)tr5+6) = (EIF_REFERENCE) tr6;
	RTAR(tr5,tr6);
	tr6 = RTMS_EX_H("NW",2,20055);
	*((EIF_REFERENCE *)tr5+7) = (EIF_REFERENCE) tr6;
	RTAR(tr5,tr6);
	tr4 = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE))  RTWF(2686, Dtype(tr5)))(tr5).it_r;
	ur2 = tr4;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(7121, Dtype(tr3)))(tr3, ur2x);
	RTNHOOK(19,1);
	ur2 = RTCCL(tr3);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(7128, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(19,2);
	ur1 = RTCCL(tr1);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(2339, "extend", loc4))(loc4, ur1x);
	RTHOOK(20);
	ur1 = RTCCL(loc4);
	tr1 = RTMS_EX_H("move",4,1836021349);
	ur2 = tr1;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3002, "extend", Result))(Result, ur1x, ur2x);
	RTHOOK(21);
	RTDBGAL(5, 0xF8000277, 0, 0); /* loc5 */
	{
		static EIF_TYPE_INDEX typarr0[] = {0xFF01,631,0xFF01,1072,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
		tr1 = RTLN(typres0.id);
	}
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(2880, Dtype(tr1)))(tr1);
	RTNHOOK(21,1);
	loc5 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(22);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(2331, "compare_objects", loc5))(loc5);
	RTHOOK(23);
	ur1 = RTCCL(loc5);
	tr1 = RTMS_EX_H("land",4,1818324580);
	ur2 = tr1;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3002, "extend", Result))(Result, ur1x, ur2x);
	RTHOOK(24);
	RTDBGAL(6, 0xF8000277, 0, 0); /* loc6 */
	{
		static EIF_TYPE_INDEX typarr0[] = {0xFF01,631,0xFF01,1072,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
		tr1 = RTLN(typres0.id);
	}
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(2880, Dtype(tr1)))(tr1);
	RTNHOOK(24,1);
	loc6 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(25);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(2331, "compare_objects", loc6))(loc6);
	RTHOOK(26);
	ur1 = RTCCL(loc6);
	tr1 = RTMS_EX_H("liftoff",7,684384358);
	ur2 = tr1;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3002, "extend", Result))(Result, ur1x, ur2x);
	RTHOOK(27);
	RTDBGAL(7, 0xF8000277, 0, 0); /* loc7 */
	{
		static EIF_TYPE_INDEX typarr0[] = {0xFF01,631,0xFF01,1072,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
		tr1 = RTLN(typres0.id);
	}
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(2880, Dtype(tr1)))(tr1);
	RTNHOOK(27,1);
	loc7 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(28);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(2331, "compare_objects", loc7))(loc7);
	RTHOOK(29);
	ur1 = RTCCL(loc7);
	tr1 = RTMS_EX_H("pass",4,1885434739);
	ur2 = tr1;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3002, "extend", Result))(Result, ur1x, ur2x);
	RTHOOK(30);
	RTDBGAL(8, 0xF8000277, 0, 0); /* loc8 */
	{
		static EIF_TYPE_INDEX typarr0[] = {0xFF01,631,0xFF01,1072,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
		tr1 = RTLN(typres0.id);
	}
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(2880, Dtype(tr1)))(tr1);
	RTNHOOK(30,1);
	loc8 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(31);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(2331, "compare_objects", loc8))(loc8);
	RTHOOK(32);
	ur1 = RTCCL(loc8);
	tr1 = RTMS_EX_H("wormhole",8,2038174821);
	ur2 = tr1;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3002, "extend", Result))(Result, ur1x, ur2x);
	RTHOOK(33);
	RTDBGAL(9, 0xF8000277, 0, 0); /* loc9 */
	{
		static EIF_TYPE_INDEX typarr0[] = {0xFF01,631,0xFF01,1072,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
		tr1 = RTLN(typres0.id);
	}
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(2880, Dtype(tr1)))(tr1);
	RTNHOOK(33,1);
	loc9 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(34);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(2331, "compare_objects", loc9))(loc9);
	RTHOOK(35);
	ur1 = RTCCL(loc9);
	tr1 = RTMS_EX_H("status",6,1862012275);
	ur2 = tr1;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3002, "extend", Result))(Result, ur1x, ur2x);
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(36);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(11);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_REF; r.it_r = Result; return r; }
#undef ur1
#undef ur2
#undef ui4_1
#undef ui4_2
}

/* {ETF_TYPE_CONSTRAINTS}.comment */
EIF_TYPED_VALUE F1088_9424 (EIF_REFERENCE Current, EIF_TYPED_VALUE arg1x)
{
	GTCX
	char *l_feature_name = "comment";
	RTEX;
#define arg1 arg1x.it_r
	EIF_BOOLEAN Result = ((EIF_BOOLEAN) 0);
	
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	
	RTLI(2);
	RTLR(0,arg1);
	RTLR(1,Current);
	RTLIU(2);
	RTLU (SK_BOOL, &Result);
	RTLU(SK_REF,&arg1);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 1087, Current, 0, 1, 15665);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(1087, Current, 15665);
	RTCC(arg1, 1087, l_feature_name, 1, eif_new_type(232, 0x01), 0x01);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAL(0, 0x04000000, 1,0); /* Result */
	Result = (EIF_BOOLEAN) (EIF_BOOLEAN) 1;
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(2);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(3);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_BOOL; r.it_b = Result; return r; }
#undef arg1
}

void EIF_Minit1088 (void)
{
	GTCX
}


#ifdef __cplusplus
}
#endif
