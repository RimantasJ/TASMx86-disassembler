.model small
dbuffsize							equ 255

.stack 100h
.data
	duom_file_name_buff 			db 128, 0, 128 dup(0)
	rez_file_name_buff 			db 128, 0, 128 dup(0)

	duom_file_name_ilgio_buff 	db 0
	rez_file_name_ilgio_buff 	db 0

	duom_handle						dw 0
	rez_handle 						dw 0

	duom_buff 						db dbuffsize, 0, 255 dup('?')
	rez_buff							db dbuffsize, 0, 255 dup('?')
	;rez_buff 						db 0,0,'$'

	netinkami_failu_vardai								db 10, 13, "Ivyko klaida su failais. Patikrinkite failu vardus.$"
	duomenu_failo_atidarymo_klaida 					db 10, 13, "Duomenu_failo_atidarymo_klaida.$"
	rezultatu_failo_sukurimo_ir_atidarymo_klaida	db 10, 13, "Rezultatu_failo_sukurimoIrAtidarymo_klaida.$"
	duomenu_failo_skaitymo_klaida 					db 10, 13, "Duomenu_failo_skaitymo_klaida.$"
	rezultatu_failo_rasymo_klaida 					db 10, 13, "Rezultatu_failo_rasymo_klaida.$"
	duomenu_failo_uzdarymo_klaida 					db 10, 13, "Duomenu_failo_uzdarymo_klaida.$"
	rezultatu_failo_uzdarymo_klaida 					db 10, 13, "Rezultatu_failo_uzdarymo_klaida.$"

	info 								db "Rimantas Januskevicius 1k. 5gr. Disasembleris$"

	nauja_eilute					db 10, 13, "$"
	neatpazintas_baitas 			db "Neatpazintas baitas"
	tarpas 							db "                "
	kablelis 						db ","
	skliaustai						db "[]"
	h_raide 							db "h"
	dvitaskis 						db ":"

	vardas_mov			db "mov "
	vardas_and 			db "and "
	vardas_push			db "push"
	vardas_pop			db "pop "
	vardas_add			db "add "
	vardas_inc			db "inc "
	vardas_sub			db "sub "
	vardas_dec			db "dec "
	vardas_cmp			db "cmp "
	vardas_mul			db "mul "
	vardas_div			db "div "
	vardas_call			db "call"
	vardas_ret			db "ret "
	vardas_jmp			db "jmp "
	vardas_loop			db "lopp"
	vardas_int			db "int "
	vardas_jcxz			db "jcxz"

	vardas_jnp			db "jnp "
	vardas_jo			db "jo  "
	vardas_jb			db "jb  "
	vardas_jae			db "jae "
	vardas_je			db "je  "
	vardas_jne			db "jne "
	vardas_jbe			db "jbe "
	vardas_ja			db "ja  "
	vardas_js			db "js  "
	vardas_jns			db "jns "
	vardas_jp			db "jp  "
	vardas_jno			db "jno "
	vardas_jl			db "jl  "
	vardas_jge			db "jge "
	vardas_jle			db "jle "
	vardas_jg			db "jg  "

	registras_al		db "al"
	registras_cl		db "cl"
	registras_dl		db "dl"
	registras_bl		db "bl"
	registras_ah		db "ah"
	registras_ch		db "ch"
	registras_dh		db "dh"
	registras_bh		db "bh"
	registras_ax		db "ax"
	registras_cx		db "cx"
	registras_dx		db "dx"
	registras_bx		db "bx"
	registras_sp		db "sp"
	registras_bp 		db "bp"
	registras_si		db "si"
	registras_di		db "di"

	registras_es 		db "es"
	registras_cs  		db "cs"
	registras_ss 		db "ss"
	registras_ds 		db "ds"

	rm_bx_si				db "[bx + si]"
	rm_bx_di				db "[bx + di]"
	rm_bp_si				db "[bp + si]"
	rm_bp_di				db "[bp + di]"
	rm_si 				db "[si]"
	rm_di 				db "[di]"
	rm_bx 				db "[bx]"
	rm_bx_si_p			db "[bx + si + "
	rm_bx_di_p			db "[bx + di + "
	rm_bp_si_p			db "[bp + si + "
	rm_bp_di_p			db "[bp + di + "
	rm_si_p 				db "[si + "
	rm_di_p 				db "[di + "
	rm_bp_p 				db "[bp + "
	rm_bx_p 				db "[bx + "

	formatu_lentele 	db  1,  1,  1,  1,  3,  3,  5,  5,  0,  0,  0,  0,  0,  0,  5,  5 ;0h  - Fh
							db  0,  0,  0,  0,  0,  0,  5,  5,  0,  0,  0,  0,  0,  0,  5,  5 ;10h - 1Fh
							db  1,  1,  1,  1,  0,  0,  0,  0,  1,  1,  1,  1,  3,  3,  0,  0 ;20h - 2Fh
							db  0,  0,  0,  0,  0,  0,  0,  0,  1,  1,  1,  1,  3,  3,  0,  0 ;30h - 3Fh
							db  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2 ;40h - 4Fh
							db  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2 ;50h - 5Fh
							db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 12, 12,  0,  0 ;60h - 6Fh
							db  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9 ;70h - 7Fh
							db 14, 14, 14, 14,  0,  0,  0,  0,  1,  1,  1,  1, 15,  0, 15, 10 ;80h - 8Fh
							db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  8,  0,  0,  0,  0,  0 ;90h - 9Fh
							db  4,  4,  4,  4,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 ;A0h - AFh
							db 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16 ;B0h - BFh
							db  0,  0,  7,  6,  0,  0,  0,  0,  0,  0,  7,  6,  0, 13,  0,  0 ;C0h - CFh
							db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 ;D0h - DFh
							db  0,  0,  9,  9,  0,  0,  0,  0, 17, 19,  8,  9,  0,  0,  0,  0 ;E0h - EFh
							db  0,  0,  0,  0,  0,  0, 10, 10,  0,  0,  0,  0,  0,  0, 10, 10 ;F0h - FFh
							;   0   1   2   3   4   5   6   7   8   9   A   B   C   D   E   F


	formato_numeris 				db 0
	pirmas_baitas					db 0
	antras_baitas 					db 0
	keiciamas_segmentas 			db 0
	mod_reiksme						db 0
	reg_reiksme 					db 0
	rm_reiksme						db 0
	d_reiksme 						db 0
	w_reiksme						db 0
	s_reiksme						db 0
	poslinkio_jb_reiksme			db 0
	poslinkio_vb_reiksme			db 0
	bojb_reiksme					db 0
	bovb_reiksme					db 0
	sg_reg_reiksme 				db 0
	sg_reg_jb_reiksme				db 0
	sg_reg_vb_reiksme				db 0
	tarpu_skaicius 				db 0

.code
start:

	call 	Proc_Failu_Vardu_Nuskaitymas
	call 	Proc_Failu_Sukurimas_Ir_Atidarymas

	mov 	cx, dbuffsize
	mov 	si, cx
	call 	Proc_Duomenu_Nuskaitymas
	mov 	di, 100h; nes com faile kodandos pradeda eiti nuo 100h baito

	PagrindinisCiklas:
		call 	Proc_Duomenu_Nuskaitymas; jei si nesutampa su cx, tai nuskaitomas naujas duomenu gabalas

		call 	Proc_Komandos_Poslinkio_Nuo_Segmeto_Pradzios_Irasymas; konvertuoja di reiksme i simboline ir atspausdina i faila pvz(xxxx:   )

		call 	Proc_Pirmas_Baitas; paima pirma komandos baita, jei tai SKP, ji issaugo ir paema tikrasi pirmaji baita ir ji irgi issaugo
		call 	Proc_Komandos_Formato_Nustatymas
		call 	Proc_Komandos_Formato_Pazinimas

		mov 	byte ptr[keiciamas_segmentas], 30h

		call 	Proc_Naujos_Eilutes_Rasymas_I_Faila

		cmp 	si, cx
		jne 	PagrindinisCiklas
		cmp 	cx, 00ffh
		jb		pabaiga
	jmp 	PagrindinisCiklas

	;Programos pabaiga
	pabaiga:
		call 	Proc_Failu_Uzdarymas

	;Programos pabaiga, jei programa baigiasi del klaidos
	pabaiga_del_error:

	mov ax, 4c00h
	int 21h

;-----error pranesimai-------------------------------------------------------------------------
	error_suskleidimui:
		; tik tam kad suskleisti visus error it kad vizualiai butu svariau ekrane
		error_netinkami_failu_vardai:
			mov	ax, @data
			mov 	ds, ax

			mov 	ah, 09h
			mov 	dx, offset netinkami_failu_vardai
			int 	21h
		jmp 	pabaiga_del_error
		error_duomenu_failo_atidarymo_klaida:
			mov 	ah, 09h
			mov 	dx, offset duomenu_failo_atidarymo_klaida
			int 	21h
		jmp 	pabaiga_del_error
		error_rezultatu_failo_sukurimo_ir_atidarymo_klaida:
			mov 	ah, 09h
			mov 	dx, offset rezultatu_failo_sukurimo_ir_atidarymo_klaida
			int 	21h
		jmp 	pabaiga_del_error
		error_duomenu_failo_skaitymo_klaida:
			mov 	ah, 09h
			mov 	dx, offset duomenu_failo_skaitymo_klaida
			int 	21h
		jmp 	pabaiga_del_error
		error_rezultatu_failo_rasymo_klaida:
			mov 	ah, 09h
			mov 	dx, offset rezultatu_failo_rasymo_klaida
			int 	21h
		jmp 	pabaiga_del_error
		error_duomenu_failo_uzdarymo_klaida:
			mov 	ah, 09h
			mov 	dx, offset duomenu_failo_uzdarymo_klaida
			int 	21h
		jmp 	pabaiga_del_error
		error_rezultatu_failo_uzdarymo_klaida:
			mov 	ah, 09h
			mov 	dx, offset rezultatu_failo_uzdarymo_klaida
			int 	21h
		jmp 	pabaiga_del_error

;-----funkcijos--------------------------------------------------------------------------------
	;General darbo su failais proceduros(neieina proceduros, irasancios reiksmes i faila)
	suskleidimui1:
		;Funkcija paema failu vardus is komandines eilutes ir atidaro(sukuria) tuos failus
		Proc_Failu_Vardu_Nuskaitymas proc
			mov		cl, [ds:80h] ;isikeliu komandines eilutes ilgi

			cmp		cl, 0 ;patikrinu, ar komandine eilute netuscia
			je 		error_cp2_netinkami_failu_vardai

			jmp 	skip_error_msg
				error_cp2_netinkami_failu_vardai:
					jmp 	error_netinkami_failu_vardai
				gal_slash_question_mark:
					dec 	si
					mov 	dl, [ds:si]
					cmp 	dl, '/'
						je 	provide_info
					jmp 	error_netinkami_failu_vardai
				provide_info:
					mov	ax, @data
					mov 	ds, ax
					mov 	ah, 09h
					mov 	dx, offset info
					int 	21h
					jmp 	pabaiga_del_error
			skip_error_msg:

			;I steka sudedu komandine eilute (nuo antro galo)
			mov		si, 81h
			add		si, cx
			PushCiklas:
				mov		dl, [ds:si]
				cmp		dl, '?'
				je 		gal_slash_question_mark
				push		dx
				dec   	si
			loop  	PushCiklas

			;Inicializuoju .data segmenta
			mov		ax, @data
			mov   	ds, ax

			;Duomenu failo vardo nuskaitymas is steko
			xor   si, si
			SpaceSkip1:
				pop 		dx
				cmp 		dl, 0dh
				je 		error_cp_netinkami_failu_vardai
				cmp 		dl, ' '
			je SpaceSkip1
			mov 		duom_file_name_buff, dl
			inc		si

			PopCiklas1:
				pop		dx
				cmp 		dl, 0dh
				je 		error_cp_netinkami_failu_vardai
				cmp   	dl, ' '
				je 		QuitPopCiklas1
				mov   	[duom_file_name_buff + si], dl
				inc   	si
			jmp  	PopCiklas1
			QuitPopCiklas1:
			mov 	bx, si
			mov 	duom_file_name_ilgio_buff, bl

			cmp 	bl, 0
			je 	error_cp_netinkami_failu_vardai

			;Rezultatu failo vardo nuskaitymas is steko
			xor   si, si
			SpaceSkip2:
				pop 		dx
				cmp 		dl, 0dh
				je 		error_cp_netinkami_failu_vardai
				cmp 		dl, ' '
			je SpaceSkip2
			mov 	rez_file_name_buff, dl
			inc	si

			PopCiklas2:
				pop   	dx
				cmp 		dl, ' '
				je 		QuitPopCiklas2
				cmp   	dl, 0dh
				je 		QuitPopCiklas2
				mov   	[rez_file_name_buff + si], dl
				inc   	si
			jmp  	PopCiklas2
			QuitPopCiklas2:
			mov 	bx, si
			mov 	rez_file_name_ilgio_buff, bl

			cmp 	bl, 0
			je 	error_cp_netinkami_failu_vardai

			;Patikrinimai ar duomenu failai nera tusti
			mov 	dl, duom_file_name_ilgio_buff
			cmp 	dl, 0
			je 	error_cp_netinkami_failu_vardai

			mov 	dl, rez_file_name_ilgio_buff
			cmp 	dl, 0
			je		error_cp_netinkami_failu_vardai

			jmp baigti_failu_vardu_nuskaityma
			error_cp_netinkami_failu_vardai:
				jmp error_netinkami_failu_vardai
			baigti_failu_vardu_nuskaityma:

			ret
		Proc_Failu_Vardu_Nuskaitymas endp

		;Funkcija atidaro (sukuria) failus
		Proc_Failu_Sukurimas_Ir_Atidarymas proc
			;Duomenu failo atidarymas
			mov 	ah, 3dh
			mov 	al, 0
			mov 	dx, offset duom_file_name_buff
			int 	21h
			jc		error_cp_duomenu_failo_atidarymo_klaida
			mov 	duom_handle, ax

			;Rezultatu failo sukurimas ir atidarymas
			mov 	ah, 3ch
			mov 	cx, 0
			mov 	dx, offset rez_file_name_buff
			int 	21h
			jc		error_cp_rezultatu_failo_sukurimo_ir_atidarymo_klaida
			mov 	rez_handle, ax

			jmp 	baigti_failu_sukurima_ir_atidaryma
			error_cp_duomenu_failo_atidarymo_klaida:
				jmp 	error_duomenu_failo_atidarymo_klaida
			error_cp_rezultatu_failo_sukurimo_ir_atidarymo_klaida:
				jmp 	error_rezultatu_failo_sukurimo_ir_atidarymo_klaida
			baigti_failu_sukurima_ir_atidaryma:

			ret
		Proc_Failu_Sukurimas_Ir_Atidarymas endp

		;Funkcija nuskaito 255 baitus is duomenu failo i buferi
		Proc_Duomenu_Nuskaitymas proc
			cmp 	cx, dbuffsize
			jb 	paskutinis_duomenu_gabalas; nustatom, jog suo metu dirbama su paskutiniu duomenu gabalu irtada nauju duomenu i buferi deti nebereikia
			cmp 	si, cx ; patikrina ar yra paimta jau tiek baitu is buferio, kad buferis butu isnaudotas. Nes tokio atveju reikia vel uzpildyti buferi
			jne 	baigti_duomenu_failo_skaityma

			;Duomenu failo skaitymas
			mov 	ah, 3fh
			mov 	bx, duom_handle
			mov 	cx, dbuffsize
			mov 	dx, offset duom_buff
			int 	21h
			jc		error_cp_duomenu_failo_skaitymo_klaida
			mov 	cx, ax ; cx issisaugau, kiek is tikruju buvo nuskaityta baitu
			xor 	si, si ; buferis naujai uzpildytai, tai padarau, kad si vel rodytu i jo pradzia

			jmp baigti_duomenu_failo_skaityma
			error_cp_duomenu_failo_skaitymo_klaida:
				jmp 	error_duomenu_failo_skaitymo_klaida
			paskutinis_duomenu_gabalas:
				cmp 	si, cx
				jne 	baigti_duomenu_failo_skaityma; jei gabalas paskutinis, bet si dar nepasieke esamo buferio pabaigos, tia testi buferio nepapildzius
				jmp 	pabaiga ;jei duomenu gabalas paskutinis ir si rodo i paskutini baita, tia laikas baigti programos vykdima
			baigti_duomenu_failo_skaityma:

			ret
		Proc_Duomenu_Nuskaitymas endp

		;Funkcija uzdaro failus
		Proc_Failu_Uzdarymas proc
			;rezultatu failo uzdarymas
			mov 	ah, 3eh
			mov 	bx, rez_handle
			int 	21h
			jc		error_cp_rezultatu_failo_uzdarymo_klaida

			;duomenu failo uzdarymas
			mov 	ah, 3eh
			mov 	bx, duom_handle
			int 	21h
			jc 	error_cp_duomenu_failo_uzdarymo_klaida

			jmp 	baigti_failu_uzdaryma
			error_cp_rezultatu_failo_uzdarymo_klaida:
				jmp 	error_rezultatu_failo_uzdarymo_klaida
			error_cp_duomenu_failo_uzdarymo_klaida:
				jmp 	error_duomenu_failo_uzdarymo_klaida
			baigti_failu_uzdaryma:

			ret
		Proc_Failu_Uzdarymas endp
	;suskleidimui1

	;Proceduros tikrinimui ir pazinimui ir nustatymui
	suskleidimui2:
		;Funkcija patikrina ar paimtas pirmas baitas nera failo keitimo prefiksas. Jei taip, tai issaugo
		Proc_Ar_Segmento_Keitimo_Prefiksas proc
			cmp 	bl, 26h ;ES
				je 	keitimas_i_es
			cmp 	bl, 2eh ;CS
				je 	keitimas_i_cs
			cmp 	bl, 36h ;SS
				je 	keitimas_i_ss
			cmp 	bl, 3eh ;DS
				je 	keitimas_i_ds
			jmp   nera_segmento_keitimo_prefikso

			keitimas_i_es:
				mov 	al, bl
				call 	Proc_Al_Baitas_I_Buferi
				call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila

				mov 	dl, 26h
				mov 	byte ptr[keiciamas_segmentas], dl
				jmp failo_prefikso_nustatymo_pabaiga
			keitimas_i_cs:
				mov 	al, bl
				call 	Proc_Al_Baitas_I_Buferi
				call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila

				mov	dl, 2eh
				mov 	byte ptr[keiciamas_segmentas], dl
				jmp failo_prefikso_nustatymo_pabaiga
			keitimas_i_ss:
				mov 	al, bl
				call 	Proc_Al_Baitas_I_Buferi
				call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila

				mov 	dl, 36h
				mov 	byte ptr[keiciamas_segmentas], dl
				jmp failo_prefikso_nustatymo_pabaiga
			keitimas_i_ds:
				mov 	al, bl
				call 	Proc_Al_Baitas_I_Buferi
				call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila

				mov 	dl, 3eh
				mov 	byte ptr[keiciamas_segmentas], dl
				jmp failo_prefikso_nustatymo_pabaiga
			nera_segmento_keitimo_prefikso:
				mov 	dl, 30h
				mov 	byte ptr[keiciamas_segmentas], dl
			failo_prefikso_nustatymo_pabaiga:

			ret
		Proc_Ar_Segmento_Keitimo_Prefiksas endp

		;Funkcija i kintamaji (formato_numeris) ideda pagal pirma baita nustatyta formato numeri pagal formatu_lentele
		Proc_Komandos_Formato_Nustatymas proc
			push 	di

			xor 	di, di
			xor 	dx, dx
			mov 	dl, byte ptr[pirmas_baitas]
			add 	di, dx

			mov 	bl, byte ptr[formatu_lentele + di]
			mov 	byte ptr[formato_numeris], bl

			pop 	di

			ret
		Proc_Komandos_Formato_Nustatymas endp

		;Funkcija pagal normatu lentele nustato nagrinejamos komandos formata
		Proc_Komandos_Formato_Pazinimas proc
			cmp 	byte ptr[formato_numeris], 1
			 	je 	formatas_1
			cmp 	byte ptr[formato_numeris], 2
			 	je 	formatas_2
			cmp 	byte ptr[formato_numeris], 3
				je 	formatas_3
			cmp 	byte ptr[formato_numeris], 4
				je 	formatas_4
			cmp 	byte ptr[formato_numeris], 5
				je 	formatas_5
			cmp 	byte ptr[formato_numeris], 6
				je 	formatas_6
			cmp 	byte ptr[formato_numeris], 7
				je 	formatas_7
			cmp 	byte ptr[formato_numeris], 8
				je 	formatas_8
			cmp 	byte ptr[formato_numeris], 9
				je 	formatas_9
			cmp 	byte ptr[formato_numeris], 10 ;veda i tolimesni atpazinima tarp 10, 11 ir 18 formatu
				je 	formatas_10_11_18
			cmp 	byte ptr[formato_numeris], 12
				je 	formatas_12
			cmp 	byte ptr[formato_numeris], 13
				je 	formatas_13
			cmp 	byte ptr[formato_numeris], 14
				je 	formatas_14
			cmp 	byte ptr[formato_numeris], 15
				je 	formatas_15
			cmp 	byte ptr[formato_numeris], 16
				je 	formatas_16
			cmp 	byte ptr[formato_numeris], 17
				je 	formatas_17
			cmp 	byte ptr[formato_numeris], 19
				je 	formatas_19
			jmp 	formatas_0

			formatas_1:
				call 	Proc_Formatas_1
				ret
			formatas_2:
				call 	Proc_Formatas_2
				ret
			formatas_3:
				call 	Proc_Formatas_3
				ret
			formatas_4:
				call 	Proc_Formatas_4
				ret
			formatas_5:
				call 	Proc_Formatas_5
				ret
			formatas_6:
				call 	Proc_Formatas_6
				ret
			formatas_7:
				call 	Proc_Formatas_7
				ret
			formatas_8:
				call 	Proc_Formatas_8
				ret
			formatas_9:
				call 	Proc_Formatas_9
				ret
			formatas_10_11_18:
				call 	Proc_Antras_Baitas

				cmp 	byte ptr[pirmas_baitas], 143
					je 	formatas_10

				cmp 	byte ptr[pirmas_baitas], 255
					jb  	formatas_11

				call 	Proc_Reg_Reiksme

				cmp 	byte ptr[reg_reiksme], 1
					jbe 	formatas_11
				cmp 	byte ptr[reg_reiksme], 2
					je 	formatas_18

				formatas_10:
					call 	Proc_Formatas_10
					ret
				formatas_11:
					call 	Proc_Formatas_11
					ret
				formatas_18:
					call 	Proc_Formatas_18
					ret
			formatas_12:
				call 	Proc_Formatas_12
				ret
			formatas_13:
				call 	Proc_Formatas_13
				ret
			formatas_14:
				call 	Proc_formatas_14
				ret
			formatas_15:
				call 	Proc_Formatas_15
				ret
			formatas_16:
				call 	Proc_Formatas_16
				ret
			formatas_17:
				call 	Proc_Formatas_17
				ret
			formatas_19:
				call 	Proc_Formatas_19
				ret
			formatas_0:
				call 	Proc_Formatas_0
				ret
		Proc_Komandos_Formato_Pazinimas endp

		;Funkcija nustato komandos varda
		Proc_Komandos_Vardo_Nustatymas proc
			xor 	ax, ax
			mov 	al, byte ptr[pirmas_baitas]
			mov 	bl, 10h
			div 	bl

			cmp 	al, 0
			je 	vardas_is_eiles_0
			cmp 	al, 1
			je 	vardas_is_eiles_1
			cmp 	al, 2
			je 	vardas_is_eiles_2
			cmp 	al, 3
			je 	vardas_is_eiles_3
			cmp 	al, 4
			je 	vardas_is_eiles_4
			cmp 	al, 5
			je 	vardas_is_eiles_5
			cmp 	al, 6
			je 	vardas_is_eiles_6
			cmp 	al, 7
			je 	vardas_is_eiles_7
			cmp 	al, 8
			je 	vardas_is_eiles_8
			cmp 	al, 9
			je 	vardas_is_eiles_9
			cmp 	al, 10
			je 	vardas_is_eiles_10
			cmp 	al, 11
			je 	vardas_is_eiles_11
			cmp 	al, 12
			je 	vardas_is_eiles_12 ;nera komandu, kuriu hex kodas is D raides
			cmp 	al, 14
			je 	vardas_is_eiles_14
			cmp 	al, 15
			je 	vardas_is_eiles_15

			vardas_is_eiles_0:
				cmp 	ah, 5
				jbe 	komandos_vardas_add_cp
				cmp 	ah, 6
				je 	komandos_vardas_push_cp
				cmp 	ah, 14
				je 	komandos_vardas_push_cp
				jmp 	komandos_vardas_pop
			vardas_is_eiles_1:
				cmp 	ah, 6
				je 	komandos_vardas_push_cp
				cmp 	ah, 14
				je 	komandos_vardas_push_cp
				jmp	komandos_vardas_pop
			vardas_is_eiles_2:
				cmp 	ah, 3
				jbe 	komandos_vardas_and
				jmp 	komandos_vardas_sub
			vardas_is_eiles_3:
				jmp 	komandos_vardas_cmp
			komandos_vardas_add_cp:
				jmp 	komandos_vardas_add
			komandos_vardas_push_cp:
				jmp 	komandos_vardas_push
			komandos_vardas_inc_cp:
				jmp 	komandos_vardas_inc
			vardas_is_eiles_4:
				cmp 	ah, 7
				jbe 	komandos_vardas_inc_cp
				jmp 	komandos_vardas_dec
			vardas_is_eiles_5:
				cmp 	ah, 7
				jbe 	komandos_vardas_push_cp
				jmp 	komandos_vardas_pop
			vardas_is_eiles_6:
				jmp 	komandos_vardas_mov
			vardas_is_eiles_7:
				jmp 	komandos_vardas_salyginis_jmp
			vardas_is_eiles_8:
				cmp 	ah, 3
				jbe 	papildomas_vardo_atpazinimas_1_cp
				cmp 	ah, 15
				je 	komandos_vardas_pop
				jmp 	komandos_vardas_mov
			vardas_is_eiles_9:
				jmp 	komandos_vardas_call
			vardas_is_eiles_10:
				jmp 	komandos_vardas_mov
			vardas_is_eiles_11:
				jmp 	komandos_vardas_mov
			vardas_is_eiles_12:
				cmp 	ah, 13
				je 	komandos_vardas_int
				jmp 	komandos_vardas_ret
			vardas_is_eiles_14:
				cmp 	ah, 2
				je 	komandos_vardas_loop
				cmp 	ah, 3
				je 	komandos_vardas_jcxz
				cmp 	ah, 8
				je 	komandos_vardas_call
				jmp 	komandos_vardas_jmp
			vardas_is_eiles_15:
				cmp 	ah, 7
				jbe 	papildomas_vardo_atpazinimas_2_cp
				jmp 	papildomas_vardo_atpazinimas_3

			papildomas_vardo_atpazinimas_1_cp:
				jmp 	papildomas_vardo_atpazinimas_1
			papildomas_vardo_atpazinimas_2_cp:
				jmp 	papildomas_vardo_atpazinimas_2


			komandos_vardas_and:
				mov 	dx, offset vardas_and
				jmp 	vardas_nustatytas
			komandos_vardas_int:
				mov 	dx, offset vardas_int
				jmp 	vardas_nustatytas
			komandos_vardas_mov:
				mov 	dx, offset vardas_mov
				jmp 	vardas_nustatytas
			komandos_vardas_pop:
				mov 	dx, offset vardas_pop
				jmp 	vardas_nustatytas
			komandos_vardas_add:
				mov 	dx, offset vardas_add
				jmp 	vardas_nustatytas
			komandos_vardas_inc:
				mov 	dx, offset vardas_inc
				jmp 	vardas_nustatytas
			komandos_vardas_jcxz:
				mov 	dx, offset vardas_jcxz
				jmp 	vardas_nustatytas
			komandos_vardas_loop:
				mov 	dx, offset vardas_loop
				jmp 	vardas_nustatytas
			komandos_vardas_sub:
				mov 	dx, offset vardas_sub
				jmp 	vardas_nustatytas
			komandos_vardas_call:
				mov 	dx, offset vardas_call
				jmp 	vardas_nustatytas
			komandos_vardas_push:
				mov 	dx, offset vardas_push
				jmp 	vardas_nustatytas
			komandos_vardas_dec:
				mov 	dx, offset vardas_dec
				jmp 	vardas_nustatytas
			komandos_vardas_cmp:
				mov 	dx, offset vardas_cmp
				jmp 	vardas_nustatytas
			komandos_vardas_mul:
				mov 	dx, offset vardas_mul
				jmp 	vardas_nustatytas
			komandos_vardas_div:
				mov 	dx, offset vardas_div
				jmp 	vardas_nustatytas
			komandos_vardas_ret:
				mov 	dx, offset vardas_ret
				jmp 	vardas_nustatytas
			komandos_vardas_jmp:
				mov 	dx, offset vardas_jmp
				jmp 	vardas_nustatytas
			komandos_vardas_salyginis_jmp:
				mov 	dx, offset vardas_jnp
				mov 	al, ah
				xor 	ah, ah
				mov 	bl, 4
				mul 	bl
				jmp 	vardas_nustatytas

			papildomas_vardo_atpazinimas_1:
				call 	Proc_Reg_Reiksme
				cmp 	byte ptr[reg_reiksme], 0
				je 	komandos_vardas_add
				cmp 	byte ptr[reg_reiksme], 5
				je 	komandos_vardas_sub
				jmp 	komandos_vardas_cmp
			papildomas_vardo_atpazinimas_2:
				call 	Proc_Reg_Reiksme
				cmp 	byte ptr[reg_reiksme], 4
				je 	komandos_vardas_mul
				jmp 	komandos_vardas_div
			papildomas_vardo_atpazinimas_3:
				call 	Proc_Reg_Reiksme
				cmp 	byte ptr[reg_reiksme], 0
				je 	komandos_vardas_inc
				cmp 	byte ptr[reg_reiksme], 1
				je 	komandos_vardas_dec
				cmp 	byte ptr[reg_reiksme], 3
				jbe 	komandos_vardas_call
				cmp 	byte ptr[reg_reiksme], 5
				jbe 	komandos_vardas_jmp
				jmp 	komandos_vardas_push



				add 	dx, ax
			vardas_nustatytas:

			ret
		Proc_Komandos_Vardo_Nustatymas endp

		;Funkcija ideda di reiksme i buferi (pvz.:0C1D:   )
		Proc_Komandos_Poslinkio_Nuo_Segmeto_Pradzios_Reiksmes_Nustatymas proc
			push 	cx
			push 	si

			mov 	si, 3
			mov 	cx, 10h
			mov 	ax, di
			di_i_buferi:
				xor 	dx, dx
				div 	cx

				call 	Proc_Dl_Skaicius_I_Simboli

				mov 	byte ptr[rez_buff + si], dl

				cmp 	si, 0
				je 	di_i_buferi_pabaiga

				dec 	si
			jmp 	di_i_buferi
			di_i_buferi_pabaiga:

			mov 	bl, ':'
			mov 	byte ptr[rez_buff + 4],	bl
			mov 	bl, ' '
			mov 	byte ptr[rez_buff + 5], bl
			mov 	byte ptr[rez_buff + 6], bl
			mov 	byte ptr[rez_buff + 7], bl

			pop 	si
			pop 	cx

			ret
		Proc_Komandos_Poslinkio_Nuo_Segmeto_Pradzios_Reiksmes_Nustatymas endp
	;suskelidimui2

	;Proceduros, nuskaitancios reikalingus baitus, bei ju pozymius
	suskleidimui3:
		;Funkcija paima pirma komandos baita
		Proc_Pirmas_Baitas proc
			call Proc_Duomenu_Nuskaitymas

			mov 	bl, byte ptr[duom_buff + si] ; paemu baita is duomenu buferio
			inc 	si
			inc 	di

			call 	Proc_Ar_Segmento_Keitimo_Prefiksas ; patikrinu ar ne SKP

			mov 	dl, byte ptr[keiciamas_segmentas]
			cmp 	dl, 30h ; 30h, tai jog nuskaitytas baitas nera SKP
			je 	baigti_pirmo_baito_nuskaityma

				mov 	bl, byte ptr[duom_buff + si] ; paemu baita is duomenu buferio
				inc 	si
				inc 	di
				mov 	byte ptr[pirmas_baitas], bl
			baigti_pirmo_baito_nuskaityma:

			mov 	byte ptr[pirmas_baitas], bl

			ret
		Proc_Pirmas_Baitas endp

		;Funkcija paima antra komandos baita
		Proc_Antras_Baitas proc
			call Proc_Duomenu_Nuskaitymas

			mov 	bl, byte ptr[duom_buff + si] ; paemu baita is duomenu buferio
			inc 	si
			inc 	di

			mov	byte ptr[antras_baitas], bl

			ret
		Proc_Antras_Baitas endp

		;Funkcija randa w pozymio reikme
		Proc_W_Reiksme proc
			push 	ax

			mov 	al, byte ptr[pirmas_baitas]
			and 	al, 1b
			mov 	byte ptr[w_reiksme], al

			pop 	ax
			ret
		Proc_W_Reiksme endp

		;Funkcija randa w pozymio reiksme is kitos vietos pirmame baite
		Proc_W_Reiksme_2 proc
			push 	ax
			push 	cx

			mov 	al, byte ptr[pirmas_baitas]
			mov 	cl, 3
			shr 	al, cl
			and 	al, 1b
			mov 	byte ptr[w_reiksme], al

			pop 	cx
			pop 	ax
			ret
		Proc_W_Reiksme_2 endp

		;Funkcija randa d pozymio reiksme
		Proc_D_Reiksme proc
			push 	ax
			push 	cx

			mov 	al, byte ptr[pirmas_baitas]
			mov 	cl, 1
			shr 	al, cl
			and 	al, 1b
			mov 	byte ptr[d_reiksme], al

			pop 	cx
			pop 	ax
			ret
		Proc_D_Reiksme endp

		;Funkcija randa s pozymio reiksme
		Proc_S_Reiksme proc
			push 	ax
			push 	cx

			mov 	al, byte ptr[pirmas_baitas]
			mov 	cl, 1
			shr 	al, cl
			and 	al, 1b
			mov 	byte ptr[s_reiksme], al

			pop 	cx
			pop 	ax
			ret
		Proc_S_Reiksme endp

		;Funkcija randa mod pozymio reiksme
		Proc_Mod_Reiksme proc
			push 	ax
			push 	cx

			mov 	al, byte ptr[antras_baitas]
			mov 	cl, 6
			shr 	al, cl
			and 	al, 11b
			mov 	byte ptr[mod_reiksme], al

			pop 	cx
			pop 	ax
			ret
		Proc_Mod_Reiksme endp

		;Funkcija randa reg pozymio reiksme antrame baite
		Proc_Reg_Reiksme proc
			push 	ax
			push 	cx

			mov 	al, byte ptr[antras_baitas]
			mov 	cl, 3
			shr 	al, cl
			and 	al, 111b
			mov 	byte ptr[reg_reiksme], al

			pop 	cx
			pop 	ax
			ret
		Proc_Reg_Reiksme endp

		;Funkcija randa reg pozymio reiksme pirmame baite
		Proc_Reg_Reiksme_2 proc
			push 	ax
			push 	cx

			mov 	al, byte ptr[pirmas_baitas]
			and 	al, 111b
			mov 	byte ptr[reg_reiksme], al

			pop 	cx
			pop 	ax
			ret
		Proc_Reg_Reiksme_2 endp

		;Funkcija randa rm pozymio reiksme
		Proc_Rm_Reiksme proc
			push 	ax
			push 	cx

			mov 	al, byte ptr[antras_baitas]
			and 	al, 111b
			mov 	byte ptr[rm_reiksme], al

			pop 	cx
			pop 	ax
			ret
		Proc_Rm_Reiksme endp

		;Funkcija nustato segmento registra is pirmo baito
		Proc_Sg_Reg_Reiksme proc
			push 	ax
			push 	cx

			mov 	al, byte ptr[pirmas_baitas]
			mov 	cl, 3
			shr 	al, cl
			and 	al, 11b
			mov 	byte ptr[sg_reg_reiksme], al

			pop 	cx
			pop 	ax
			ret
		Proc_Sg_Reg_Reiksme endp

		;Funkcija randa sg reg pozymio reiksme antrame baite
		Proc_Sg_Reg_Reiksme_2 proc
			push 	ax
			push 	cx

			mov 	al, byte ptr[antras_baitas]
			mov 	cl, 3
			shr 	al, cl
			and 	al, 11b
			mov 	byte ptr[sg_reg_reiksme], al

			pop 	cx
			pop 	ax
			ret
		Proc_Sg_Reg_Reiksme_2 endp

		;Funkcija paema segmento registro jb
		Proc_Sg_Reg_Jb_Reiksme proc
			call Proc_Duomenu_Nuskaitymas

			mov 	bl, byte ptr[duom_buff + si] ; paemu baita is duomenu buferio
			inc 	si
			inc 	di
			mov	byte ptr[sg_reg_jb_reiksme], bl

			ret
		Proc_Sg_Reg_Jb_Reiksme endp

		;Funkcija paema segmento registro vb
		Proc_Sg_Reg_Vb_Reiksme proc
			call Proc_Duomenu_Nuskaitymas

			mov 	bl, byte ptr[duom_buff + si] ; paemu baita is duomenu buferio
			inc 	si
			inc 	di
			mov	byte ptr[sg_reg_vb_reiksme], bl

			ret
		Proc_Sg_Reg_Vb_Reiksme endp

		;Funkcija paema poslinkio jb
		Proc_Poslinkio_Jb_Reiksme proc
			call Proc_Duomenu_Nuskaitymas

			mov 	bl, byte ptr[duom_buff + si] ; paemu baita is duomenu buferio
			inc 	si
			inc 	di
			mov	byte ptr[poslinkio_jb_reiksme], bl

			ret
		Proc_Poslinkio_Jb_Reiksme endp

		;Funkcija paema poslinki vb
		Proc_Poslinkio_Vb_Reiksme proc
			call Proc_Duomenu_Nuskaitymas

			mov 	bl, byte ptr[duom_buff + si] ; paemu baita is duomenu buferio
			inc 	si
			inc 	di
			mov	byte ptr[poslinkio_vb_reiksme], bl

			ret
		Proc_Poslinkio_Vb_Reiksme endp

		;Funkcija paema bojb is duomenu buferio
		Proc_Bojb_Reiksme proc
			call 	Proc_Duomenu_Nuskaitymas

			mov 	bl, byte ptr[duom_buff + si]
			inc 	si
			inc 	di
			mov 	byte ptr[bojb_reiksme], bl

			ret
		Proc_Bojb_Reiksme endp

		;Funkcija paema bovb is duomenu buferio
		Proc_Bovb_Reiksme proc
			call 	Proc_Duomenu_Nuskaitymas

			mov 	bl, byte ptr[duom_buff + si]
			inc 	si
			inc 	di
			mov 	byte ptr[bovb_reiksme], bl

			ret
		Proc_Bovb_Reiksme endp
	;suskleidimui3

	;Kitos proceduros
	suskleidimui4:
		;Funkcija taip pakoreguoja dl, jog jis is jog registre esantis hex skaicius taptu atitinkamu simbolius
		Proc_Dl_Skaicius_I_Simboli proc
			cmp 	dl, 9
			jbe 	di_simbolio_reiksme_skaicius
			add 	dl, 87
			jmp 	di_simbolio_reiksme_raide
			di_simbolio_reiksme_skaicius:
			add 	dl, 48
			di_simbolio_reiksme_raide:

			ret
		Proc_Dl_Skaicius_I_Simboli endp

		;Funkcija ideda Al hex reiksme, kaip 2 simbolius i rez buff
		Proc_Al_Baitas_I_Buferi proc
			push 	ax
			push 	bx
			push 	cx
			push 	dx

			xor 	dx, dx
			mov 	cx, 10h
			div 	cx
			call 	Proc_Dl_Skaicius_I_Simboli
			mov 	byte ptr[rez_buff + 1], dl
			xor 	dx, dx
			div 	cx
			call 	Proc_Dl_Skaicius_I_Simboli
			mov 	byte ptr[rez_buff], dl

			pop 	dx
			pop 	cx
			pop 	bx
			pop 	ax
			ret
		Proc_Al_Baitas_I_Buferi endp

		;Funkcija patikrina ar rasymas i faila buvo sekmingas
		Proc_Ar_Rasymas_I_Faila_Sekmingas proc
			jc		error_rasymo_i_faila_klaida

			jmp 	klaidos_nera
			error_rasymo_i_faila_klaida:
				jmp 	error_rezultatu_failo_rasymo_klaida
			klaidos_nera:

			ret
		Proc_Ar_Rasymas_I_Faila_Sekmingas endp
	;suskleidimui4

	;Proceduros rasymui i faila
	suskleidimui5:
		;Funkcija iraso i faila pirmus du simbolios is rez buff
		Proc_Rez_Buff_Baito_Irasymas_I_Faila proc
			push 	ax
			push 	bx
			push 	cx
			push 	dx

			mov 	ah, 40h
			mov 	cx, 2
			mov 	bx, rez_handle
			mov 	dx, offset rez_buff
			int 	21h
			call 	Proc_Ar_Rasymas_I_Faila_Sekmingas

			pop 	dx
			pop 	cx
			pop 	bx
			pop 	ax

			ret
		Proc_Rez_Buff_Baito_Irasymas_I_Faila endp

		;Funkcija suranda ir isveda i rezultatu faila komandos poslinki nuo kodo segmento pradzios
		Proc_Komandos_Poslinkio_Nuo_Segmeto_Pradzios_Irasymas proc
			push 	cx

			call Proc_Komandos_Poslinkio_Nuo_Segmeto_Pradzios_Reiksmes_Nustatymas

			mov 	ah, 40h
			mov 	cx, 8
			mov 	bx, rez_handle
			mov 	dx, offset rez_buff
			int 	21h
			call 	Proc_Ar_Rasymas_I_Faila_Sekmingas

			pop 	cx

			ret
		Proc_Komandos_Poslinkio_Nuo_Segmeto_Pradzios_Irasymas endp

		;Funkcija iraso i failas pirma baita
		Proc_Komandos_Pirmo_Baito_Irasymas proc
			push 	ax
			push 	bx
			push 	cx
			push 	dx

			mov 	al, byte ptr[pirmas_baitas]
			call 	Proc_Al_Baitas_I_Buferi

			call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila

			pop 	dx
			pop 	cx
			pop 	bx
			pop 	ax

			ret
		Proc_Komandos_Pirmo_Baito_Irasymas endp

		;Funkcija iraso i faila antra baitas
		Proc_Komandos_Antro_Baito_Irasymas proc
			push 	ax
			push 	bx
			push 	cx
			push 	dx

			mov 	al, byte ptr[antras_baitas]
			call 	Proc_Al_Baitas_I_Buferi

			call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila

			pop 	dx
			pop 	cx
			pop 	bx
			pop 	ax

			ret
		Proc_Komandos_Antro_Baito_Irasymas endp

		;Funkcija iraso i faila komandos varda
		Proc_Komandos_Vardo_Irasymas_I_Faila proc
			call 	Proc_Komandos_Vardo_Nustatymas

			push 	cx

			cmp 	byte ptr[keiciamas_segmentas], 30h
				jne 	segmentas_yra_keiciamas

				call 	Proc_Tarpo_Rasymas_I_Faila
				call 	Proc_Tarpo_Rasymas_I_Faila
			segmentas_yra_keiciamas:

			mov 	ah, 40h
			mov 	cx, 4
			mov 	bx, rez_handle
			;i dx idetas vardo offset(tai padaryta vardo nustatymo proceduroj)
			int 	21h
			call 	Proc_Ar_Rasymas_I_Faila_Sekmingas

			pop cx
			ret
		Proc_Komandos_Vardo_Irasymas_I_Faila endp

		;Funkcija nustato, reg ir rm ir juo iraso i faila
		Proc_Reg_Rm_Sutvarkimas_Ir_Irasymas_I_Faila proc
			cmp 	byte ptr[d_reiksme], 1
			je 	rm_spausdinimas
			reg_spausdinimas:
				call 	Proc_Rm_I_Faila
				cmp 	byte ptr[d_reiksme], 1
				je 	operandu_spausdinimo_pabaiga

				call 	Proc_Kablelio_Rasymas_I_Faila ;irasau kableli
				call 	Proc_Tarpo_Rasymas_I_Faila ;irasau tarpa
			rm_spausdinimas:
				call 	Proc_Reg_I_Faila
				cmp 	byte ptr[d_reiksme], 1
				je 	kablelis_tarpas_spausdinimas
			operandai_atspausdinti:

			jmp 	operandu_spausdinimo_pabaiga
			kablelis_tarpas_spausdinimas:
				call 	Proc_Kablelio_Rasymas_I_Faila ;irasau kableli
				call 	Proc_Tarpo_Rasymas_I_Faila ;irasau tarpa
				jmp 	reg_spausdinimas
			operandu_spausdinimo_pabaiga:

			ret
		Proc_Reg_Rm_Sutvarkimas_Ir_Irasymas_I_Faila endp

		;Funkcija nustato reg ir iraso i faila
		Proc_Reg_I_Faila proc
			push 	cx

			cmp 	byte ptr[reg_reiksme], 0
				je 	reg_reiksme_0
			cmp 	byte ptr[reg_reiksme], 1
				je 	reg_reiksme_1
			cmp 	byte ptr[reg_reiksme], 2
				je 	reg_reiksme_2
			cmp 	byte ptr[reg_reiksme], 3
				je 	reg_reiksme_3
			cmp 	byte ptr[reg_reiksme], 4
				je 	reg_reiksme_4
			cmp 	byte ptr[reg_reiksme], 5
				je 	reg_reiksme_5
			cmp 	byte ptr[reg_reiksme], 6
				je 	reg_reiksme_6
			cmp 	byte ptr[reg_reiksme], 7
				je 	reg_reiksme_7

			reg_reiksme_0:
				mov 	dx, offset registras_al
				jmp 	registras_nustatytas
			reg_reiksme_1:
				mov 	dx, offset registras_cl
				jmp 	registras_nustatytas
			reg_reiksme_2:
				mov 	dx, offset registras_dl
				jmp 	registras_nustatytas
			reg_reiksme_3:
				mov 	dx, offset registras_bl
				jmp 	registras_nustatytas
			reg_reiksme_4:
				mov 	dx, offset registras_ah
				jmp 	registras_nustatytas
			reg_reiksme_5:
				mov 	dx, offset registras_ch
				jmp 	registras_nustatytas
			reg_reiksme_6:
				mov 	dx, offset registras_dh
				jmp 	registras_nustatytas
			reg_reiksme_7:
				mov 	dx, offset registras_bh
				jmp 	registras_nustatytas

			registras_nustatytas:
			cmp 	byte ptr[w_reiksme], 0
				je 	registras_vieno_baito
				add 	dx, 16
			registras_vieno_baito:

			;atspausdinamas 2 simboliu registro vardas
			mov 	ah, 40h
			mov 	cx, 2
			mov 	bx, rez_handle
			int 	21h
			call 	Proc_Ar_Rasymas_I_Faila_Sekmingas

			pop 	cx

			ret
		Proc_Reg_I_Faila endp

		;Funkcija nustato segmento registra ir iraso jo varda i faila
		Proc_Sg_Reg_I_Faila proc
			push 	cx

			cmp 	byte ptr[sg_reg_reiksme], 0
				je 	sg_reg_es
			cmp 	byte ptr[sg_reg_reiksme], 1
				je 	sg_reg_cs
			cmp 	byte ptr[sg_reg_reiksme], 2
				je 	sg_reg_ss
			jmp 	sg_reg_ds

			sg_reg_es:
				mov 	dx, offset registras_es
				jmp 	sg_reg_spausdinimas
			sg_reg_ss:
				mov 	dx, offset registras_ss
				jmp 	sg_reg_spausdinimas
			sg_reg_cs:
				mov 	dx, offset registras_cs
				jmp 	sg_reg_spausdinimas
			sg_reg_ds:
				mov 	dx, offset registras_ds
				jmp 	sg_reg_spausdinimas

			sg_reg_spausdinimas:
				mov 	ah, 40h
				mov 	bx, rez_handle
				mov 	cx, 2
				int 	21h
				call 	Proc_Ar_Rasymas_I_Faila_Sekmingas

			pop 	cx
			ret
		Proc_Sg_Reg_I_Faila endp

		;Funkcija nustato rm ir iraso i failai
		Proc_Rm_I_Faila proc
			push 	cx

			;sios proceduros vykdymo metu reikalingi poslinkio baitai jau turetu buti nuskaityti
			cmp 	byte ptr[mod_reiksme], 0
				je 	mod_reiksme_00
			cmp 	byte ptr[mod_reiksme], 3
				je 	mod_reiksme_11
			jmp 	mod_reiksme_01_10

			mod_reiksme_00:
				call 	Proc_Segmento_Keitimo_Prefiksas_I_Faila
				cmp 	byte ptr[rm_reiksme], 0
					je 	spausdinti_bx_si
				cmp 	byte ptr[rm_reiksme], 1
					je 	spausdinti_bx_di
				cmp 	byte ptr[rm_reiksme], 2
					je 	spausdinti_bp_si
				cmp 	byte ptr[rm_reiksme], 3
					je 	spausdinti_bp_di
				cmp 	byte ptr[rm_reiksme], 4
					je 	spausdinti_si
				cmp 	byte ptr[rm_reiksme], 5
					je 	spausdinti_di
				cmp 	byte ptr[rm_reiksme], 6
					je 	spausdinti_tiesiogini
				;jie nei vienas is esanciu virsuje, tai tiesiog ir nueina i spausdinti_bx

			spausdinti_bx:
				mov 	dx, offset rm_bx
				mov 	cx, 4
				jmp 	spausdinti_rm
			spausdinti_bx_si:
				mov 	dx, offset rm_bx_si
				mov 	cx, 9
				jmp 	spausdinti_rm
			spausdinti_bx_di:
				mov 	dx, offset rm_bx_di
				mov 	cx, 9
				jmp 	spausdinti_rm
			spausdinti_bp_si:
				mov 	dx, offset rm_bp_si
				mov 	cx, 9
				jmp 	spausdinti_rm
			spausdinti_bp_di:
				mov 	dx, offset rm_bp_di
				mov 	cx, 9
				jmp 	spausdinti_rm
			spausdinti_si:
				mov 	dx, offset rm_si
				mov 	cx, 4
				jmp 	spausdinti_rm
			spausdinti_di:
				mov 	dx, offset rm_di
				mov 	cx, 4
				jmp 	spausdinti_rm
			spausdinti_tiesiogini:
				call 	Proc_Segmento_Keitimo_Prefiksas_I_Faila
				call 	Proc_Kairio_Skliausto_Rasymas_I_Faila
				jmp 	spausdinti_du_baitus


			mod_reiksme_11:
				cmp 	byte ptr[rm_reiksme], 0
					je 	rm_reiksme_0
				cmp 	byte ptr[rm_reiksme], 1
					je 	rm_reiksme_1
				cmp 	byte ptr[rm_reiksme], 2
					je 	rm_reiksme_2
				cmp 	byte ptr[rm_reiksme], 3
					je 	rm_reiksme_3
				cmp 	byte ptr[rm_reiksme], 4
					je 	rm_reiksme_4
				cmp 	byte ptr[rm_reiksme], 5
					je 	rm_reiksme_5
				cmp 	byte ptr[rm_reiksme], 6
					je 	rm_reiksme_6
				jmp 	rm_reiksme_7

			rm_reiksme_0:
				mov 	dx, offset registras_al
				mov 	cx, 2
				jmp 	registro_korekcija_pagal_w
			rm_reiksme_1:
				mov 	dx, offset registras_cl
				mov 	cx, 2
				jmp 	registro_korekcija_pagal_w
			rm_reiksme_2:
				mov 	dx, offset registras_dl
				mov 	cx, 2
				jmp 	registro_korekcija_pagal_w
			rm_reiksme_3:
				mov 	dx, offset registras_bl
				mov 	cx, 2
				jmp 	registro_korekcija_pagal_w
			rm_reiksme_4:
				mov 	dx, offset registras_ax
				mov 	cx, 2
				jmp 	registro_korekcija_pagal_w
			rm_reiksme_5:
				mov 	dx, offset registras_cx
				mov 	cx, 2
				jmp 	registro_korekcija_pagal_w
			rm_reiksme_6:
				mov 	dx, offset registras_dx
				mov 	cx, 2
				jmp 	registro_korekcija_pagal_w
			rm_reiksme_7:
				mov 	dx, offset registras_bx
				mov 	cx, 2
				jmp 	registro_korekcija_pagal_w

			mod_reiksme_01_10:
				call 	Proc_Segmento_Keitimo_Prefiksas_I_Faila
				cmp 	byte ptr[rm_reiksme], 0
					je 	spausdinti_bx_si_p
				cmp 	byte ptr[rm_reiksme], 1
					je 	spausdinti_bx_di_p
				cmp 	byte ptr[rm_reiksme], 2
					je 	spausdinti_bp_si_p
				cmp 	byte ptr[rm_reiksme], 3
					je 	spausdinti_bp_di_p
				cmp 	byte ptr[rm_reiksme], 4
					je 	spausdinti_si_p
				cmp 	byte ptr[rm_reiksme], 5
				 	je 	spausdinti_di_p
				cmp 	byte ptr[rm_reiksme], 6
				 	je 	spausdinti_bp_p
				jmp 	spausdinti_bx_p

			spausdinti_bx_si_p:
				mov 	dx, offset rm_bx_si_p
				mov 	cx, 11
				jmp 	spausdinti_rm
			spausdinti_bx_di_p:
				mov 	dx, offset rm_bx_di_p
				mov 	cx, 11
				jmp 	spausdinti_rm
			spausdinti_bp_si_p:
				mov 	dx, offset rm_bp_si_p
				mov 	cx, 11
				jmp 	spausdinti_rm
			spausdinti_bp_di_p:
				mov 	dx, offset rm_bp_di_p
				mov 	cx, 11
				jmp 	spausdinti_rm
			spausdinti_si_p:
				mov 	dx, offset rm_si_p
				mov 	cx, 6
				jmp 	spausdinti_rm
			spausdinti_di_p:
				mov 	dx, offset rm_di_p
				mov 	cx, 6
				jmp 	spausdinti_rm
			spausdinti_bp_p:
				mov 	dx, offset rm_di_p
				mov 	cx, 6
				jmp 	spausdinti_rm
			spausdinti_bx_p:
				mov 	dx, offset rm_bx_p
				mov 	cx, 6
				jmp 	spausdinti_rm

			registro_korekcija_pagal_w:
				cmp 	byte ptr[w_reiksme], 0
				je 	spausdinti_rm
				add 	dx, 16
			;atspausdinu viena is anksciau apsirasytu variantu(pvz: [bx + si])
			spausdinti_rm:
				mov 	ah, 40h
				mov 	bx, rez_handle
				int  	21h
				call 	Proc_Ar_Rasymas_I_Faila_Sekmingas

			cmp 	byte ptr[mod_reiksme], 1
				je 	spausdinti_viena_baita
			cmp 	byte ptr[mod_reiksme], 2
				je 	spausdinti_du_baitus
			jmp 	rm_atspausdintas

			spausdinti_viena_baita:
				mov 	al, byte ptr[poslinkio_jb_reiksme]
				call 	Proc_Al_Baitas_I_Buferi
				call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila
				call 	Proc_H_Raides_Rasymas_I_Faila
				call 	Proc_Desinio_Skliausto_Rasymas_I_Faila
				jmp 	rm_atspausdintas
			spausdinti_du_baitus:
				mov 	al, byte ptr[poslinkio_vb_reiksme]
				call 	Proc_Al_Baitas_I_Buferi
				call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila
				mov 	al, byte ptr[poslinkio_jb_reiksme]
				call 	Proc_Al_Baitas_I_Buferi
				call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila
				call 	Proc_H_Raides_Rasymas_I_Faila
				call 	Proc_Desinio_Skliausto_Rasymas_I_Faila

			rm_atspausdintas:

			pop 	cx

			ret
		Proc_Rm_I_Faila endp

		;Funkcija atspausdina segnemto keitimo prefiksa
		Proc_Segmento_Keitimo_Prefiksas_I_Faila proc
			push 	ax
			push 	bx
			push 	cx
			push 	dx

			xor 	bx, bx
			mov 	bl, byte ptr[keiciamas_segmentas]

			cmp 	bl, 26h
				je 	keiciamas_i_es
			cmp 	bl, 2eh
				je 	keiciamas_i_cs
			cmp 	bl, 36h
				je 	keiciamas_i_ss
			cmp 	bl, 3eh
				je 	keiciamas_i_ds
			jmp 	nekeiciamas

			keiciamas_i_es:
				mov 	dx, offset registras_es
				jmp 	irasyti_skp
			keiciamas_i_cs:
				mov 	dx, offset registras_cs
				jmp 	irasyti_skp
			keiciamas_i_ss:
				mov 	dx, offset registras_ss
				jmp 	irasyti_skp
			keiciamas_i_ds:
				mov 	dx, offset registras_ds
				jmp 	irasyti_skp

			irasyti_skp:
				push 	cx
				mov 	ah, 40h
				mov 	bx, rez_handle
				mov 	cx, 2
				int 	21h
				call 	Proc_Ar_Rasymas_I_Faila_Sekmingas
				pop 	cx

				call 	Proc_Dvitaskio_Rasymas_I_Faila

			nekeiciamas:

			pop 	dx
			pop 	cx
			pop 	bx
			pop 	ax

			ret
		Proc_Segmento_Keitimo_Prefiksas_I_Faila endp
	;suskleidimui5

	;Proceduros zenklams i faila rasyti
	suskleidimui6:
		;Funkcija spausdina viena tarpa i faila
		Proc_Tarpo_Rasymas_I_Faila proc
			push 	ax
			push 	bx
			push 	cx
			push 	dx

			mov 	ah, 40h
			mov 	cx, 1
			mov 	bx, rez_handle
			mov 	dx, offset 	tarpas
			int 	21h
			call 	Proc_Ar_Rasymas_I_Faila_Sekmingas

			pop 	dx
			pop 	cx
			pop 	bx
			pop 	ax
			ret
		Proc_Tarpo_Rasymas_I_Faila endp

		;Funkcija pradeda nauja eilute faile
		Proc_Naujos_Eilutes_Rasymas_I_Faila proc
			push 	ax
			push 	bx
			push 	cx
			push 	dx

			mov 	ah, 40h
			mov 	bx, rez_handle
			mov 	cx, 2
			mov 	dx, offset nauja_eilute
			int 	21h
			call 	Proc_Ar_Rasymas_I_Faila_Sekmingas

			pop 	dx
			pop 	cx
			pop 	bx
			pop 	ax
			ret
		Proc_Naujos_Eilutes_Rasymas_I_Faila endp

		;Funkcija spausdina viena kableli i faila
		Proc_Kablelio_Rasymas_I_Faila proc
			push 	ax
			push 	bx
			push 	cx
			push 	dx

			mov 	ah, 40h
			mov 	cx, 1
			mov 	bx, rez_handle
			mov 	dx, offset 	kablelis
			int 	21h
			call 	Proc_Ar_Rasymas_I_Faila_Sekmingas

			pop 	dx
			pop 	cx
			pop 	bx
			pop 	ax
			ret
		Proc_Kablelio_Rasymas_I_Faila endp

		;Funkcija spausdina viena dvitaski i faila
		Proc_Dvitaskio_Rasymas_I_Faila proc
			push 	ax
			push 	bx
			push 	cx
			push 	dx

			mov 	ah, 40h
			mov 	cx, 1
			mov 	bx, rez_handle
			mov 	dx, offset 	dvitaskis
			int 	21h
			call 	Proc_Ar_Rasymas_I_Faila_Sekmingas

			pop 	dx
			pop 	cx
			pop 	bx
			pop 	ax
			ret
		Proc_Dvitaskio_Rasymas_I_Faila endp

		;Funkcija spausdina viena kableli i faila
		Proc_Kairio_Skliausto_Rasymas_I_Faila proc
			push 	ax
			push 	bx
			push 	cx
			push 	dx

			call 	Proc_Segmento_Keitimo_Prefiksas_I_Faila

			mov 	ah, 40h
			mov 	cx, 1
			mov 	bx, rez_handle
			mov 	dx, offset 	skliaustai
			int 	21h
			call 	Proc_Ar_Rasymas_I_Faila_Sekmingas

			pop 	dx
			pop 	cx
			pop 	bx
			pop 	ax
			ret
		Proc_Kairio_Skliausto_Rasymas_I_Faila endp

		;Funkcija spausdina viena kableli i faila
		Proc_Desinio_Skliausto_Rasymas_I_Faila proc
			push 	ax
			push 	bx
			push 	cx
			push 	dx

			mov 	ah, 40h
			mov 	cx, 1
			mov 	bx, rez_handle
			mov 	dx, offset 	[skliaustai + 1]
			int 	21h
			call 	Proc_Ar_Rasymas_I_Faila_Sekmingas

			pop 	dx
			pop 	cx
			pop 	bx
			pop 	ax
			ret
		Proc_Desinio_Skliausto_Rasymas_I_Faila endp

		;Funkcija atspausdina h railede(kei reikia pabrezti kad skaicius sesioliktainis)
		Proc_H_Raides_Rasymas_I_Faila proc
			push 	cx

			mov 	ah, 40h
			mov 	bx, rez_handle
			mov 	cx, 1
			mov 	dx, offset h_raide
			int 	21h
			call 	Proc_Ar_Rasymas_I_Faila_Sekmingas

			pop 	cx
			ret
		Proc_H_Raides_Rasymas_I_Faila endp
	;suskleidimui6

	;Proceduros kiekvienam formatui
	suskleidimui7:
		;Funkcija vykdo formatas 0 procedura(ty, formatas neatpaintas)
		Proc_Formatas_0 proc
			;irasau i rezultato faila pirmaji baita (xxxx:   8cxx ...)
			call 	Proc_Komandos_Pirmo_Baito_Irasymas

			push 	cx

			;atspuasdinu 9 tarpus i rezultatu faila po neatpazinto baito
			mov 	ah, 40h
			mov 	cx, 16
			mov 	bx, rez_handle
			mov 	dx, offset tarpas
			int 	21h
			call 	Proc_Ar_Rasymas_I_Faila_Sekmingas

			;atspausdinu i rezultatu faila 'neatpazintas baitas'
			mov 	ah, 40h
			mov 	cx, 19
			mov 	bx, rez_handle
			mov 	dx, offset neatpazintas_baitas
			int 	21h
			call 	Proc_Ar_Rasymas_I_Faila_Sekmingas

			pop cx

			ret
		Proc_Formatas_0 endp

		;Funkcijos uzraso komandos varda ir desiniaja puse pagal nustatyta formata
		Proc_Formatas_1 proc
			call 	Proc_Antras_Baitas
			call 	Proc_W_Reiksme
			call 	Proc_D_Reiksme
			call 	Proc_Mod_Reiksme
			call 	Proc_Reg_Reiksme
			call 	Proc_Rm_Reiksme

			;irasau i rezultato faila pirmaji baita (xxxx:   8cxx ...)
			call 	Proc_Komandos_Pirmo_Baito_Irasymas

			;irasau i rezultatu buferi antraji baita(xxxx:   xxce ...)
			call 	Proc_Komandos_Antro_Baito_Irasymas

			;nustatau ar yra poslinkis, nustatau, kiek baitu jis uzema ir irasau tuos baitus
			cmp 	byte ptr[mod_reiksme], 0
				je 	form1_mod_00
			cmp 	byte ptr[mod_reiksme], 1
				je 	form1_mod_01
			cmp 	byte ptr[mod_reiksme], 2
				je 	form1_mod_10
			cmp 	byte ptr[mod_reiksme], 3
				je 	form1_mod_11

			form1_mod_00:;jei reikia, nuskaito ir iraso 1 tiesiogines adresacijos baita
				cmp 	byte ptr[rm_reiksme], 6
					jne 	form1_mod_11
				jmp 	form1_mod_10
			form1_mod_01:;nuskaito ir iraso 1 poslinkio baita
				call 	Proc_Poslinkio_Jb_Reiksme
				mov 	al, byte ptr[poslinkio_jb_reiksme]
				call 	Proc_Al_Baitas_I_Buferi
				call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila

				call 	Proc_Tarpo_Rasymas_I_Faila
				call 	Proc_Tarpo_Rasymas_I_Faila

				jmp 	form1_poslinkio_baitai_nuskaityti
			form1_mod_10:;nuskaito ir iraso 2 poslinkio baitus
				call 	Proc_Poslinkio_Jb_Reiksme
				call 	Proc_Poslinkio_Vb_Reiksme

				mov 	al, byte ptr[poslinkio_jb_reiksme]
				call 	Proc_Al_Baitas_I_Buferi
				call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila

				mov 	al, byte ptr[poslinkio_vb_reiksme]
				call 	Proc_Al_Baitas_I_Buferi
				call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila

				jmp 	form1_poslinkio_baitai_nuskaityti
			form1_mod_11:
				call 	Proc_Tarpo_Rasymas_I_Faila
				call 	Proc_Tarpo_Rasymas_I_Faila
				call 	Proc_Tarpo_Rasymas_I_Faila
				call 	Proc_Tarpo_Rasymas_I_Faila
			form1_poslinkio_baitai_nuskaityti:

			push 	cx
			mov 	ah, 40h
			mov 	cx, 8
			mov 	bx, rez_handle
			mov 	dx, offset tarpas
			int 	21h
			call 	Proc_Ar_Rasymas_I_Faila_Sekmingas
			pop 	cx

			call 	Proc_Komandos_Vardo_Irasymas_I_Faila ; irasau i faila komandos varda

			call 	Proc_Tarpo_Rasymas_I_Faila ;irasau tarpa

			call 	Proc_Reg_Rm_Sutvarkimas_Ir_Irasymas_I_Faila

			ret
		Proc_Formatas_1 endp

		Proc_Formatas_2 proc
			call 	Proc_Reg_Reiksme_2

			call 	Proc_Komandos_Pirmo_Baito_Irasymas

			push 	cx
			;atspuasdinu 9 tarpus i rezultatu faila po neatpazinto baito
			mov 	ah, 40h
			mov 	cx, 9
			mov 	bx, rez_handle
			mov 	dx, offset tarpas
			int 	21h
			call 	Proc_Ar_Rasymas_I_Faila_Sekmingas
			pop 	cx

			push 	cx
			mov 	ah, 40h
			mov 	cx, 5
			mov 	bx, rez_handle
			mov 	dx, offset tarpas
			int 	21h
			call 	Proc_Ar_Rasymas_I_Faila_Sekmingas
			pop 	cx

			call 	Proc_Komandos_Vardo_Irasymas_I_Faila

			call 	Proc_Tarpo_Rasymas_I_Faila

			mov 	byte ptr[w_reiksme], 1

			call 	Proc_Reg_I_Faila

			ret
		Proc_Formatas_2 endp

		Proc_formatas_3 proc
			call 	Proc_W_Reiksme
			call 	Proc_Bojb_Reiksme

			call 	Proc_Komandos_Pirmo_Baito_Irasymas

			mov 	al, byte ptr[bojb_reiksme]
			call 	Proc_Al_Baitas_I_Buferi
			call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila

			mov 	dx, offset registras_al

			cmp 	byte ptr[w_reiksme], 0
				je 	form_3_bovb_nereikia
				call 	Proc_Bovb_Reiksme
				mov 	al, byte ptr[bovb_reiksme]
				call 	Proc_Al_Baitas_I_Buferi
				call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila

				mov 	dx, offset registras_ax
				jmp 	form_3_bovb_reikia
			form_3_bovb_nereikia:
				call 	Proc_Tarpo_Rasymas_I_Faila
				call 	Proc_Tarpo_Rasymas_I_Faila
			form_3_bovb_reikia:

			push 	cx
			mov 	ah, 40h
			mov 	cx, 10
			mov 	bx, rez_handle
			mov 	dx, offset tarpas
			int 	21h
			call 	Proc_Ar_Rasymas_I_Faila_Sekmingas
			pop 	cx

			push 	dx

			call 	Proc_Komandos_Vardo_Irasymas_I_Faila

			call 	Proc_Tarpo_Rasymas_I_Faila

			;irasau registro al arba ax varda
			pop 	dx
			push 	cx
			mov 	ah, 40h
			mov 	bx, rez_handle
			mov 	cx, 2
			int 	21h
			call 	Proc_Ar_Rasymas_I_Faila_Sekmingas
			pop 	cx

			call  Proc_Kablelio_Rasymas_I_Faila
			call 	Proc_Tarpo_Rasymas_I_Faila

			cmp 	byte ptr[w_reiksme], 0
				je 	form_3_bovb_nereikia_2
				mov 	al, byte ptr[bovb_reiksme]
				call 	Proc_Al_Baitas_I_Buferi
				call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila
			form_3_bovb_nereikia_2:


			mov 	al, byte ptr[bojb_reiksme]
			call 	Proc_Al_Baitas_I_Buferi
			call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila

			push 	cx
			mov 	ah, 40h
			mov 	bx, rez_handle
			mov 	cx, 1
			mov 	dx, offset h_raide
			int 	21h
			call 	Proc_Ar_Rasymas_I_Faila_Sekmingas
			pop 	cx

			ret
		Proc_formatas_3 endp

		Proc_Formatas_4 proc
			call	Proc_W_Reiksme
			;siuo atveju, kad nereiketu atskirai rasyti, adresacijos baitus nusiskaiciau i betarpisku operandu vietas
			call 	Proc_Bojb_Reiksme
			call 	Proc_Bovb_Reiksme

			call 	Proc_Komandos_Pirmo_Baito_Irasymas
			mov 	al, byte ptr[bojb_reiksme]
			call 	Proc_Al_Baitas_I_Buferi
			call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila
			mov 	al, byte ptr[bovb_reiksme]
			call 	Proc_Al_Baitas_I_Buferi
			call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila

			push 	cx
			mov 	ah, 40h
			mov 	cx, 10
			mov 	bx, rez_handle
			mov 	dx, offset tarpas
			int 	21h
			call 	Proc_Ar_Rasymas_I_Faila_Sekmingas
			pop 	cx

			call 	Proc_Komandos_Vardo_Irasymas_I_Faila

			call 	Proc_Tarpo_Rasymas_I_Faila

			cmp 	byte ptr[pirmas_baitas], 161
				jbe 	form4_adr_i_akum

			form4_adr_i_akum_2:
			;atspausdinu registro varda
			mov 	dx, offset registras_al
			cmp 	byte ptr[w_reiksme], 0
				je 	form4_vieno_baito_registras
				add 	dx, 16
			form4_vieno_baito_registras:

			push 	cx
			mov 	ah, 40h
			mov 	bx, rez_handle
			mov 	cx, 2
			int 	21h
			call 	Proc_Ar_Rasymas_I_Faila_Sekmingas
			pop 	cx

			cmp 	byte ptr[pirmas_baitas], 161
				jbe 	form4_baigta

			call 	Proc_Kablelio_Rasymas_I_Faila
			call 	Proc_Tarpo_Rasymas_I_Faila

			form4_adr_i_akum:
			;[
			call 	Proc_Kairio_Skliausto_Rasymas_I_Faila

			mov 	al, byte ptr[bovb_reiksme]
			call 	Proc_Al_Baitas_I_Buferi
			call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila

			mov 	al, byte ptr[bojb_reiksme]
			call 	Proc_Al_Baitas_I_Buferi
			call	Proc_Rez_Buff_Baito_Irasymas_I_Faila

			call 	Proc_H_Raides_Rasymas_I_Faila

			;]
			call 	Proc_Desinio_Skliausto_Rasymas_I_Faila

			cmp 	byte ptr[pirmas_baitas], 161
				ja 	form4_baigta

			call 	Proc_Kablelio_Rasymas_I_Faila
			call 	Proc_Tarpo_Rasymas_I_Faila

			cmp 	byte ptr[pirmas_baitas], 161
				jbe 	form4_adr_i_akum_2

			form4_baigta:


			ret
		Proc_Formatas_4 endp

		Proc_Formatas_5 proc
			call 	Proc_Sg_Reg_Reiksme

			call 	Proc_Komandos_Pirmo_Baito_Irasymas

			push 	cx
			;atspuasdinu 9 tarpus i rezultatu faila po neatpazinto baito
			mov 	ah, 40h
			mov 	cx, 14
			mov 	bx, rez_handle
			mov 	dx, offset tarpas
			int 	21h
			call 	Proc_Ar_Rasymas_I_Faila_Sekmingas
			pop 	cx

			call 	Proc_Komandos_Vardo_Irasymas_I_Faila

			call 	Proc_Tarpo_Rasymas_I_Faila

			call 	Proc_Sg_Reg_I_Faila

			ret
		Proc_Formatas_5 endp

		Proc_Formatas_6 proc
			call 	Proc_Komandos_Pirmo_Baito_Irasymas

			push 	cx
			;atspuasdinu 9 tarpus i rezultatu faila po neatpazinto baito
			mov 	ah, 40h
			mov 	cx, 14
			mov 	bx, rez_handle
			mov 	dx, offset tarpas
			int 	21h
			call 	Proc_Ar_Rasymas_I_Faila_Sekmingas
			pop 	cx

			call 	Proc_Komandos_Vardo_Irasymas_I_Faila

			ret
		Proc_Formatas_6 endp

		Proc_Formatas_7 proc
			call 	Proc_Bojb_Reiksme
			call 	Proc_Bovb_Reiksme

			call 	Proc_Komandos_Pirmo_Baito_Irasymas
			mov 	al, byte ptr[bojb_reiksme]
			call 	Proc_Al_Baitas_I_Buferi
			call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila
			mov 	al, byte ptr[bovb_reiksme]
			call 	Proc_Al_Baitas_I_Buferi
			call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila

			push 	cx
			mov 	ah, 40h
			mov 	cx, 10
			mov 	bx, rez_handle
			mov 	dx, offset tarpas
			int 	21h
			call 	Proc_Ar_Rasymas_I_Faila_Sekmingas
			pop 	cx

			call 	Proc_Komandos_Vardo_Irasymas_I_Faila

			call  Proc_Tarpo_Rasymas_I_Faila

			mov 	al, byte ptr[bovb_reiksme]
			call 	Proc_Al_Baitas_I_Buferi
			call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila
			mov 	al, byte ptr[bojb_reiksme]
			call 	Proc_Al_Baitas_I_Buferi
			call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila
			call 	Proc_H_Raides_Rasymas_I_Faila

			ret
		Proc_Formatas_7 endp

		Proc_Formatas_8 proc
			;cia naudoju poslinkio baitams skirtas funkcijas operuot su adresacijos baitais
			call 	Proc_Poslinkio_Jb_Reiksme
			call 	Proc_Poslinkio_Vb_Reiksme
			call 	Proc_Sg_Reg_Jb_Reiksme
			call 	Proc_Sg_Reg_Vb_Reiksme

			call 	Proc_Komandos_Pirmo_Baito_Irasymas

			mov 	al, byte ptr[poslinkio_jb_reiksme]
			call 	Proc_Al_Baitas_I_Buferi
			call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila
			mov 	al, byte ptr[poslinkio_vb_reiksme]
			call 	Proc_Al_Baitas_I_Buferi
			call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila

			mov 	al, byte ptr[sg_reg_jb_reiksme]
			call 	Proc_Al_Baitas_I_Buferi
			call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila
			mov 	al, byte ptr[sg_reg_vb_reiksme]
			call 	Proc_Al_Baitas_I_Buferi
			call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila

			push 	cx
			mov 	ah, 40h
			mov 	cx, 6
			mov 	bx, rez_handle
			mov 	dx, offset tarpas
			int 	21h
			call 	Proc_Ar_Rasymas_I_Faila_Sekmingas
			pop 	cx

			call 	Proc_Komandos_Vardo_Irasymas_I_Faila

			call 	Proc_Tarpo_Rasymas_I_Faila

			call 	Proc_Kairio_Skliausto_Rasymas_I_Faila

			mov 	al, byte ptr[sg_reg_vb_reiksme]
			call 	Proc_Al_Baitas_I_Buferi
			call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila
			mov 	al, byte ptr[sg_reg_jb_reiksme]
			call 	Proc_Al_Baitas_I_Buferi
			call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila
			call 	Proc_H_Raides_Rasymas_I_Faila

			call 	Proc_Dvitaskio_Rasymas_I_Faila

			mov 	al, byte ptr[poslinkio_vb_reiksme]
			call 	Proc_Al_Baitas_I_Buferi
			call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila
			mov 	al, byte ptr[poslinkio_jb_reiksme]
			call 	Proc_Al_Baitas_I_Buferi
			call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila
			call 	Proc_H_Raides_Rasymas_I_Faila

			call 	Proc_Desinio_Skliausto_Rasymas_I_Faila

			ret
		Proc_Formatas_8 endp

		Proc_Formatas_9 proc
			call 	Proc_Poslinkio_Jb_Reiksme

			call 	Proc_Komandos_Pirmo_Baito_Irasymas
			mov 	al, byte ptr[poslinkio_jb_reiksme]
			call 	Proc_Al_Baitas_I_Buferi
			call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila

			push 	cx
			mov 	ah, 40h
			mov 	cx, 12
			mov 	bx, rez_handle
			mov 	dx, offset tarpas
			int 	21h
			call 	Proc_Ar_Rasymas_I_Faila_Sekmingas
			pop 	cx

			call 	Proc_Komandos_Vardo_Irasymas_I_Faila

			call 	Proc_Tarpo_Rasymas_I_Faila

			mov 	al, byte ptr[poslinkio_jb_reiksme]
			cbw
			add 	ax, di

			mov 	dx, ax
			mov 	al, dh
			call 	Proc_Al_Baitas_I_Buferi
			call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila
			mov 	al, dl
			call 	Proc_Al_Baitas_I_Buferi
			call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila
			call 	Proc_H_Raides_Rasymas_I_Faila

			ret
		Proc_Formatas_9 endp

		Proc_Formatas_10 proc
			;antras baitas suo atveju jau nuskaitytas, skirint formata
			call 	Proc_Mod_Reiksme
			call 	Proc_Rm_Reiksme

			call 	Proc_Komandos_Pirmo_Baito_Irasymas
			call 	Proc_Komandos_Antro_Baito_Irasymas

			;nustatau ar yra poslinkis, nustatau, kiek baitu jis uzema ir irasau tuos baitus
			cmp 	byte ptr[mod_reiksme], 0
				je 	form10_mod_00
			cmp 	byte ptr[mod_reiksme], 1
				je 	form10_mod_01
			cmp 	byte ptr[mod_reiksme], 2
				je 	form10_mod_10
			cmp 	byte ptr[mod_reiksme], 3
				je 	form10_mod_11

			form10_mod_00:;jei reikia, nuskaito ir iraso 1 tiesiogines adresacijos baita
				cmp 	byte ptr[rm_reiksme], 6
					jne 	form10_mod_11
				jmp 	form10_mod_10
			form10_mod_01:;nuskaito ir iraso 1 poslinkio baita
				call 	Proc_Poslinkio_Jb_Reiksme
				mov 	al, byte ptr[poslinkio_jb_reiksme]
				call 	Proc_Al_Baitas_I_Buferi
				call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila

				call 	Proc_Tarpo_Rasymas_I_Faila
				call 	Proc_Tarpo_Rasymas_I_Faila

				jmp 	form10_poslinkio_baitai_nuskaityti
			form10_mod_10:;nuskaito ir iraso 2 poslinkio baitus
				call 	Proc_Poslinkio_Jb_Reiksme
				call 	Proc_Poslinkio_Vb_Reiksme

				mov 	al, byte ptr[poslinkio_jb_reiksme]
				call 	Proc_Al_Baitas_I_Buferi
				call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila

				mov 	al, byte ptr[poslinkio_vb_reiksme]
				call 	Proc_Al_Baitas_I_Buferi
				call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila

				jmp 	form10_poslinkio_baitai_nuskaityti
			form10_mod_11:
				call 	Proc_Tarpo_Rasymas_I_Faila
				call 	Proc_Tarpo_Rasymas_I_Faila
				call 	Proc_Tarpo_Rasymas_I_Faila
				call 	Proc_Tarpo_Rasymas_I_Faila
			form10_poslinkio_baitai_nuskaityti:

			push 	cx
			mov 	ah, 40h
			mov 	cx, 8
			mov 	bx, rez_handle
			mov 	dx, offset tarpas
			int 	21h
			call 	Proc_Ar_Rasymas_I_Faila_Sekmingas
			pop 	cx

			call 	Proc_Komandos_Vardo_Irasymas_I_Faila

			call 	Proc_Tarpo_Rasymas_I_Faila
			mov 	byte ptr[w_reiksme], 1
			call 	Proc_Rm_I_Faila

			ret
		Proc_Formatas_10 endp

		Proc_Formatas_11 proc
			;antras baitas suo atveju jau nuskaitytas, skirint formata

			call 	Proc_Mod_Reiksme
			call 	Proc_Rm_Reiksme

			call 	Proc_Komandos_Pirmo_Baito_Irasymas
			call 	Proc_Komandos_Antro_Baito_Irasymas

			;nustatau ar yra poslinkis, nustatau, kiek baitu jis uzema ir irasau tuos baitus
			cmp 	byte ptr[mod_reiksme], 0
				je 	form11_mod_00
			cmp 	byte ptr[mod_reiksme], 1
				je 	form11_mod_01
			cmp 	byte ptr[mod_reiksme], 2
				je 	form11_mod_10
			cmp 	byte ptr[mod_reiksme], 3
				je 	form11_mod_11

			form11_mod_00:;jei reikia, nuskaito ir iraso 1 tiesiogines adresacijos baita
				cmp 	byte ptr[rm_reiksme], 6
					jne 	form11_mod_11
				jmp 	form11_mod_10
			form11_mod_01:;nuskaito ir iraso 1 poslinkio baita
				call 	Proc_Poslinkio_Jb_Reiksme
				mov 	al, byte ptr[poslinkio_jb_reiksme]
				call 	Proc_Al_Baitas_I_Buferi
				call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila

				call 	Proc_Tarpo_Rasymas_I_Faila
				call 	Proc_Tarpo_Rasymas_I_Faila

				jmp 	form11_poslinkio_baitai_nuskaityti
			form11_mod_10:;nuskaito ir iraso 2 poslinkio baitus
				call 	Proc_Poslinkio_Jb_Reiksme
				call 	Proc_Poslinkio_Vb_Reiksme

				mov 	al, byte ptr[poslinkio_jb_reiksme]
				call 	Proc_Al_Baitas_I_Buferi
				call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila

				mov 	al, byte ptr[poslinkio_vb_reiksme]
				call 	Proc_Al_Baitas_I_Buferi
				call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila

				jmp 	form11_poslinkio_baitai_nuskaityti
			form11_mod_11:
				call 	Proc_Tarpo_Rasymas_I_Faila
				call 	Proc_Tarpo_Rasymas_I_Faila
				call 	Proc_Tarpo_Rasymas_I_Faila
				call 	Proc_Tarpo_Rasymas_I_Faila
			form11_poslinkio_baitai_nuskaityti:

			push 	cx
			mov 	ah, 40h
			mov 	cx, 8
			mov 	bx, rez_handle
			mov 	dx, offset tarpas
			int 	21h
			call 	Proc_Ar_Rasymas_I_Faila_Sekmingas
			pop 	cx

			call 	Proc_Komandos_Vardo_Irasymas_I_Faila

			call 	Proc_Tarpo_Rasymas_I_Faila
			call 	Proc_W_Reiksme
			call 	Proc_Rm_I_Faila

			ret
		Proc_Formatas_11 endp

		Proc_Formatas_12 proc
			call 	Proc_Antras_Baitas
			call 	Proc_W_Reiksme
			call 	Proc_Mod_Reiksme
			call 	Proc_Rm_Reiksme

			call 	Proc_Komandos_Pirmo_Baito_Irasymas
			call 	Proc_Komandos_Antro_Baito_Irasymas

			;nustatau ar yra poslinkis, nustatau, kiek baitu jis uzema ir irasau tuos baitus
			cmp 	byte ptr[mod_reiksme], 0
				je 	form12_mod_00
			cmp 	byte ptr[mod_reiksme], 1
				je 	form12_mod_01
			cmp 	byte ptr[mod_reiksme], 2
				je 	form12_mod_10
			cmp 	byte ptr[mod_reiksme], 3
				je 	form12_mod_11

			form12_mod_00:;jei reikia, nuskaito ir iraso 1 tiesiogines adresacijos baita
				cmp 	byte ptr[rm_reiksme], 6
					jne 	form12_mod_11
				jmp 	form12_mod_10
			form12_mod_01:;nuskaito ir iraso 1 poslinkio baita
				call 	Proc_Poslinkio_Jb_Reiksme
				mov 	al, byte ptr[poslinkio_jb_reiksme]
				call 	Proc_Al_Baitas_I_Buferi
				call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila

				jmp 	form12_poslinkio_baitai_nuskaityti
			form12_mod_10:;nuskaito ir iraso 2 poslinkio baitus
				call 	Proc_Poslinkio_Jb_Reiksme
				call 	Proc_Poslinkio_Vb_Reiksme

				mov 	al, byte ptr[poslinkio_jb_reiksme]
				call 	Proc_Al_Baitas_I_Buferi
				call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila

				mov 	al, byte ptr[poslinkio_vb_reiksme]
				call 	Proc_Al_Baitas_I_Buferi
				call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila

				jmp 	form12_poslinkio_baitai_nuskaityti
			form12_mod_11:
			form12_poslinkio_baitai_nuskaityti:

			call 	Proc_Bojb_Reiksme
			mov 	al, byte ptr[bojb_reiksme]
			call 	Proc_Al_Baitas_I_Buferi
			call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila

			cmp 	byte ptr[w_reiksme], 0
				je 	form12_bovb_nera
				call 	Proc_Bovb_Reiksme
				mov 	al, byte ptr[bovb_reiksme]
				call 	Proc_Al_Baitas_I_Buferi
				call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila

				jmp 	form12_bovb_yra
			form12_bovb_nera:
				call 	Proc_Tarpo_Rasymas_I_Faila
				call 	Proc_Tarpo_Rasymas_I_Faila
			form12_bovb_yra:

			;papildomi tarpai del poslinkio
			cmp 	byte ptr[mod_reiksme], 1
				je 	form12_1_tarpas
			cmp 	byte ptr[mod_reiksme], 2
				je 	form12_tarpai_irasyti
			jmp 	form12_2_tarpai

			form12_1_tarpas:
				call 	Proc_Tarpo_Rasymas_I_Faila
				call 	Proc_Tarpo_Rasymas_I_Faila
				jmp 	form12_tarpai_irasyti
			form12_2_tarpai:
				push 	cx
				mov 	ah, 40h
				mov 	cx, 4
				mov 	bx, rez_handle
				mov 	dx, offset tarpas
				int 	21h
				call 	Proc_Ar_Rasymas_I_Faila_Sekmingas
				pop 	cx
				jmp 	form12_tarpai_irasyti
			form12_tarpai_irasyti:

			push 	cx
			mov 	ah, 40h
			mov 	cx, 4
			mov 	bx, rez_handle
			mov 	dx, offset tarpas
			int 	21h
			call 	Proc_Ar_Rasymas_I_Faila_Sekmingas
			pop 	cx

			call 	Proc_Komandos_Vardo_Irasymas_I_Faila
			call 	Proc_Tarpo_Rasymas_I_Faila
			call 	Proc_Rm_I_Faila
			call 	Proc_Kablelio_Rasymas_I_Faila
			call 	Proc_Tarpo_Rasymas_I_Faila

			cmp 	byte ptr[w_reiksme], 0
				je 	form12_bovb_neirasyti
				mov 	al, byte ptr[bovb_reiksme]
				call 	Proc_Al_Baitas_I_Buferi
				call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila

			form12_bovb_neirasyti:
			mov 	al, byte ptr[bojb_reiksme]
			call 	Proc_Al_Baitas_I_Buferi
			call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila
			call 	Proc_H_Raides_Rasymas_I_Faila

			ret
		Proc_Formatas_12 endp

		Proc_Formatas_13 proc
			;tipa nuskaitau i bojb reiksme
			call 	Proc_Bojb_Reiksme

			call 	Proc_Komandos_Pirmo_Baito_Irasymas
			mov 	al, byte ptr[bojb_reiksme]
			call 	Proc_Al_Baitas_I_Buferi
			call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila

			push 	cx
			mov 	ah, 40h
			mov 	cx, 12
			mov 	bx, rez_handle
			mov 	dx, offset tarpas
			int 	21h
			call 	Proc_Ar_Rasymas_I_Faila_Sekmingas
			pop 	cx

			call 	Proc_Komandos_Vardo_Irasymas_I_Faila

			call 	Proc_Tarpo_Rasymas_I_Faila

			mov 	al, byte ptr[bojb_reiksme]
			call 	Proc_Al_Baitas_I_Buferi
			call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila
			call 	Proc_H_Raides_Rasymas_I_Faila

			ret
		Proc_Formatas_13 endp

		Proc_Formatas_14 proc
			call 	Proc_Antras_Baitas
			call 	Proc_S_Reiksme
			call 	Proc_W_Reiksme
			call 	Proc_Mod_Reiksme
			call 	Proc_Rm_Reiksme

			call 	Proc_Komandos_Pirmo_Baito_Irasymas
			call 	Proc_Komandos_Antro_Baito_Irasymas

			;nustatau ar yra poslinkis, nustatau, kiek baitu jis uzema ir irasau tuos baitus
			cmp 	byte ptr[mod_reiksme], 0
				je 	form14_mod_00
			cmp 	byte ptr[mod_reiksme], 1
				je 	form14_mod_01
			cmp 	byte ptr[mod_reiksme], 2
				je 	form14_mod_10
			cmp 	byte ptr[mod_reiksme], 3
				je 	form14_mod_11

			form14_mod_00:;jei reikia, nuskaito ir iraso 1 tiesiogines adresacijos baita
				cmp 	byte ptr[rm_reiksme], 6
					jne 	form14_mod_11
				jmp 	form14_mod_10
			form14_mod_01:;nuskaito ir iraso 1 poslinkio baita
				call 	Proc_Poslinkio_Jb_Reiksme
				mov 	al, byte ptr[poslinkio_jb_reiksme]
				call 	Proc_Al_Baitas_I_Buferi
				call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila

				jmp 	form14_poslinkio_baitai_nuskaityti
			form14_mod_10:;nuskaito ir iraso 2 poslinkio baitus
				call 	Proc_Poslinkio_Jb_Reiksme
				call 	Proc_Poslinkio_Vb_Reiksme

				mov 	al, byte ptr[poslinkio_jb_reiksme]
				call 	Proc_Al_Baitas_I_Buferi
				call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila

				mov 	al, byte ptr[poslinkio_vb_reiksme]
				call 	Proc_Al_Baitas_I_Buferi
				call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila

				jmp 	form14_poslinkio_baitai_nuskaityti
			form14_mod_11:
			form14_poslinkio_baitai_nuskaityti:

			;betarpisko operando baitu (ir tarpu vietoj ju), nuskaitymas ir irasymas
			call 	Proc_Bojb_Reiksme
			mov 	al, byte ptr[bojb_reiksme]
			call 	Proc_Al_Baitas_I_Buferi
			call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila

			cmp 	byte ptr[w_reiksme], 0
				je 	form14_bovb_nera
			cmp 	byte ptr[s_reiksme], 1
				je 	form14_bovb_pleciamas

			call 	Proc_Bovb_Reiksme
			mov 	al, byte ptr[bovb_reiksme]
			call 	Proc_Al_Baitas_I_Buferi
			call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila
			jmp 	form14_bo_nuskaityti
			form14_bovb_pleciamas:
				mov 	al, byte ptr[bojb_reiksme]
				cbw
				mov 	byte ptr[bovb_reiksme], ah
			form14_bovb_nera:
				call 	Proc_Tarpo_Rasymas_I_Faila
				call 	Proc_Tarpo_Rasymas_I_Faila
			form14_bo_nuskaityti:

			;papildomi tarpai del poslinkio
			cmp 	byte ptr[mod_reiksme], 1
				je 	form14_1_tarpas
			cmp 	byte ptr[mod_reiksme], 2
				je 	form14_tarpai_irasyti
			cmp 	byte ptr[mod_reiksme], 3
				je 	form14_2_tarpai
			cmp 	byte ptr[rm_reiksme], 6
				je 	form14_tarpai_irasyti
			jmp 	form14_2_tarpai

			form14_1_tarpas:
				call 	Proc_Tarpo_Rasymas_I_Faila
				call 	Proc_Tarpo_Rasymas_I_Faila
				jmp 	form14_tarpai_irasyti
			form14_2_tarpai:

				call 	Proc_Tarpo_Rasymas_I_Faila
				call 	Proc_Tarpo_Rasymas_I_Faila
				call 	Proc_Tarpo_Rasymas_I_Faila
				call 	Proc_Tarpo_Rasymas_I_Faila
				jmp 	form14_tarpai_irasyti
			form14_tarpai_irasyti:

			call 	Proc_Tarpo_Rasymas_I_Faila
			call 	Proc_Tarpo_Rasymas_I_Faila
			call 	Proc_Tarpo_Rasymas_I_Faila
			call 	Proc_Tarpo_Rasymas_I_Faila

			call 	Proc_Komandos_Vardo_Irasymas_I_Faila
			call 	Proc_Tarpo_Rasymas_I_Faila
			call 	Proc_Rm_I_Faila
			call 	Proc_Kablelio_Rasymas_I_Faila
			call 	Proc_Tarpo_Rasymas_I_Faila

			cmp 	byte ptr[w_reiksme], 0
				je 	form14_bovb_neirasyti
			mov 	al, byte ptr[bovb_reiksme]
			call 	Proc_Al_Baitas_I_Buferi
			call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila

			form14_bovb_neirasyti:
			mov 	al, byte ptr[bojb_reiksme]
			call 	Proc_Al_Baitas_I_Buferi
			call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila
			call 	Proc_H_Raides_Rasymas_I_Faila

			ret
		Proc_Formatas_14 endp

		Proc_Formatas_15 proc
			call 	Proc_Antras_Baitas
			call 	Proc_D_Reiksme
			call 	Proc_Mod_Reiksme
			call 	Proc_Sg_Reg_Reiksme_2
			call 	Proc_Rm_Reiksme

			mov 	byte ptr[w_reiksme], 1

			call 	Proc_Komandos_Pirmo_Baito_Irasymas
			call 	Proc_Komandos_Antro_Baito_Irasymas

			;nustatau ar yra poslinkis, nustatau, kiek baitu jis uzema ir irasau tuos baitus
			cmp 	byte ptr[mod_reiksme], 0
				je 	form15_mod_00
			cmp 	byte ptr[mod_reiksme], 1
				je 	form15_mod_01
			cmp 	byte ptr[mod_reiksme], 2
				je 	form15_mod_10
			cmp 	byte ptr[mod_reiksme], 3
				je 	form15_mod_11

			form15_mod_00:;jei reikia, nuskaito ir iraso 1 tiesiogines adresacijos baita
				cmp 	byte ptr[rm_reiksme], 6
					jne 	form15_mod_11
				jmp 	form15_mod_10
			form15_mod_01:;nuskaito ir iraso 1 poslinkio baita
				call 	Proc_Poslinkio_Jb_Reiksme
				mov 	al, byte ptr[poslinkio_jb_reiksme]
				call 	Proc_Al_Baitas_I_Buferi
				call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila

				call 	Proc_Tarpo_Rasymas_I_Faila
				call 	Proc_Tarpo_Rasymas_I_Faila

				jmp 	form15_poslinkio_baitai_nuskaityti
			form15_mod_10:;nuskaito ir iraso 2 poslinkio baitus
				call 	Proc_Poslinkio_Jb_Reiksme
				call 	Proc_Poslinkio_Vb_Reiksme

				mov 	al, byte ptr[poslinkio_jb_reiksme]
				call 	Proc_Al_Baitas_I_Buferi
				call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila

				mov 	al, byte ptr[poslinkio_vb_reiksme]
				call 	Proc_Al_Baitas_I_Buferi
				call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila

				jmp 	form15_poslinkio_baitai_nuskaityti
			form15_mod_11:
			form15_poslinkio_baitai_nuskaityti:

			push 	cx
			mov 	ah, 40h
			mov 	cx, 8
			mov 	bx, rez_handle
			mov 	dx, offset tarpas
			int 	21h
			call 	Proc_Ar_Rasymas_I_Faila_Sekmingas
			pop 	cx

			call 	Proc_Komandos_Vardo_Irasymas_I_Faila

			call 	Proc_Tarpo_Rasymas_I_Faila

			cmp 	byte ptr[d_reiksme], 1
				je 	form15_sg_rm
			form15_sg_rm_2:
			call 	Proc_Rm_I_Faila
			cmp 	byte ptr[d_reiksme], 1
				je 	form15_pabaiga

			call 	Proc_Kablelio_Rasymas_I_Faila
			call 	Proc_Tarpo_Rasymas_I_Faila

			form15_sg_rm:
			call 	Proc_Sg_Reg_I_Faila
			cmp 	byte ptr[d_reiksme], 0
				je 	form15_pabaiga
			call 	Proc_Kablelio_Rasymas_I_Faila
			call 	Proc_Tarpo_Rasymas_I_Faila
			cmp 	byte ptr[d_reiksme], 1
				je 	form15_sg_rm_2

			form15_pabaiga:

			ret
		Proc_Formatas_15 endp

		Proc_Formatas_16 proc
			call 	Proc_W_Reiksme_2
			call 	Proc_Reg_Reiksme_2

			call 	Proc_Komandos_Pirmo_Baito_Irasymas

			call 	Proc_Bojb_Reiksme
			mov 	al, byte ptr[bojb_reiksme]
			call 	Proc_Al_Baitas_I_Buferi
			call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila

			cmp 	byte ptr[w_reiksme], 0
				je 	form_16_bovb_nera

			call 	Proc_Bovb_Reiksme
			mov 	al, byte ptr[bovb_reiksme]
			call 	Proc_Al_Baitas_I_Buferi
			call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila

			cmp 	byte ptr[w_reiksme], 1
				je 	form16_bovb_yra
			form_16_bovb_nera:
				call 	Proc_Tarpo_Rasymas_I_Faila
				call 	Proc_Tarpo_Rasymas_I_Faila
			form16_bovb_yra:

			push 	cx
			mov 	ah, 40h
			mov 	cx, 10
			mov 	bx, rez_handle
			mov 	dx, offset tarpas
			int 	21h
			call 	Proc_Ar_Rasymas_I_Faila_Sekmingas
			pop 	cx

			call 	Proc_Komandos_Vardo_Irasymas_I_Faila

			call 	Proc_Tarpo_Rasymas_I_Faila

			call 	Proc_Reg_I_Faila

			call 	Proc_Kablelio_Rasymas_I_Faila
			call 	Proc_Tarpo_Rasymas_I_Faila

			cmp 	byte ptr[w_reiksme], 0
				je 	form16_bovb_neirasyti

			mov 	al, byte ptr[bovb_reiksme]
			call 	Proc_Al_Baitas_I_Buferi
			call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila

			form16_bovb_neirasyti:

			mov 	al, byte ptr[bojb_reiksme]
			call 	Proc_Al_Baitas_I_Buferi
			call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila

			call 	Proc_H_Raides_Rasymas_I_Faila

			ret
		Proc_Formatas_16 endp

		Proc_Formatas_17 proc
			;adresacijos baitus nuskaitau i poslinkio baitu vietas
			call 	Proc_Poslinkio_Jb_Reiksme
			call 	Proc_Poslinkio_Vb_Reiksme

			call 	Proc_Komandos_Pirmo_Baito_Irasymas

			mov 	al, byte ptr[poslinkio_jb_reiksme]
			call 	Proc_Al_Baitas_I_Buferi
			call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila
			mov 	al, byte ptr[poslinkio_vb_reiksme]
			call 	Proc_Al_Baitas_I_Buferi
			call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila

			push 	cx
			mov 	ah, 40h
			mov 	cx, 10
			mov 	bx, rez_handle
			mov 	dx, offset tarpas
			int 	21h
			call 	Proc_Ar_Rasymas_I_Faila_Sekmingas
			pop 	cx

			call 	Proc_Komandos_Vardo_Irasymas_I_Faila

			call 	Proc_Tarpo_Rasymas_I_Faila

			call 	Proc_Kairio_Skliausto_Rasymas_I_Faila

			mov 	ah, byte ptr[poslinkio_vb_reiksme]
			mov 	al, byte ptr[poslinkio_jb_reiksme]
			add 	ax, di

			mov 	dx, ax
			mov 	al, dh
			call 	Proc_Al_Baitas_I_Buferi
			call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila
			mov 	al, dl
			call 	Proc_Al_Baitas_I_Buferi
			call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila
			call 	Proc_H_Raides_Rasymas_I_Faila

			call 	Proc_Desinio_Skliausto_Rasymas_I_Faila

			ret
		Proc_Formatas_17 endp

		Proc_Formatas_18 proc
			;antras baitas jau paimtas
			call 	Proc_Mod_Reiksme
			call 	Proc_Rm_Reiksme

			mov 	byte ptr[w_reiksme], 1

			call 	Proc_Komandos_Pirmo_Baito_Irasymas
			call 	Proc_Komandos_Antro_Baito_Irasymas

			;nustatau ar yra poslinkis, nustatau, kiek baitu jis uzema ir irasau tuos baitus
			cmp 	byte ptr[mod_reiksme], 0
				je 	form18_mod_00
			cmp 	byte ptr[mod_reiksme], 1
				je 	form18_mod_01
			cmp 	byte ptr[mod_reiksme], 2
				je 	form18_mod_10
			cmp 	byte ptr[mod_reiksme], 3
				je 	form18_mod_11

			form18_mod_00:;jei reikia, nuskaito ir iraso 1 tiesiogines adresacijos baita
				cmp 	byte ptr[rm_reiksme], 6
					jne 	form18_mod_11
				jmp 	form18_mod_10
			form18_mod_01:;nuskaito ir iraso 1 poslinkio baita
				call 	Proc_Poslinkio_Jb_Reiksme
				mov 	al, byte ptr[poslinkio_jb_reiksme]
				call 	Proc_Al_Baitas_I_Buferi
				call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila

				call 	Proc_Tarpo_Rasymas_I_Faila
				call 	Proc_Tarpo_Rasymas_I_Faila

				jmp 	form18_poslinkio_baitai_nuskaityti
			form18_mod_10:;nuskaito ir iraso 2 poslinkio baitus
				call 	Proc_Poslinkio_Jb_Reiksme
				call 	Proc_Poslinkio_Vb_Reiksme

				mov 	al, byte ptr[poslinkio_jb_reiksme]
				call 	Proc_Al_Baitas_I_Buferi
				call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila

				mov 	al, byte ptr[poslinkio_vb_reiksme]
				call 	Proc_Al_Baitas_I_Buferi
				call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila

				jmp 	form18_poslinkio_baitai_nuskaityti
			form18_mod_11:
				call 	Proc_Tarpo_Rasymas_I_Faila
				call 	Proc_Tarpo_Rasymas_I_Faila
				call 	Proc_Tarpo_Rasymas_I_Faila
				call 	Proc_Tarpo_Rasymas_I_Faila
			form18_poslinkio_baitai_nuskaityti:

			push 	cx
			mov 	ah, 40h
			mov 	cx, 8
			mov 	bx, rez_handle
			mov 	dx, offset tarpas
			int 	21h
			call 	Proc_Ar_Rasymas_I_Faila_Sekmingas
			pop 	cx

			call 	Proc_Komandos_Vardo_Irasymas_I_Faila
			call 	Proc_Tarpo_Rasymas_I_Faila

			cmp 	byte ptr[mod_reiksme], 3
				jne 	papildomu_skliaustu_nereikia_1
			call 	Proc_Kairio_Skliausto_Rasymas_I_Faila
			papildomu_skliaustu_nereikia_1:

			call 	Proc_Rm_I_Faila

			cmp 	byte ptr[mod_reiksme], 3
				jne 	papildomu_skliaustu_nereikia_2
			call 	Proc_Desinio_Skliausto_Rasymas_I_Faila
			papildomu_skliaustu_nereikia_2:

			ret
		Proc_Formatas_18 endp

		Proc_Formatas_19 proc
			call 	Proc_Komandos_Pirmo_Baito_Irasymas

			call	Proc_Poslinkio_Jb_Reiksme
			mov 	al, byte ptr[poslinkio_jb_reiksme]
			call 	Proc_Al_Baitas_I_Buferi
			call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila

			call 	Proc_Poslinkio_Vb_Reiksme
			mov 	al, byte ptr[poslinkio_vb_reiksme]
			call 	Proc_Al_Baitas_I_Buferi
			call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila

			push 	cx
			mov 	ah, 40h
			mov 	cx, 10
			mov 	bx, rez_handle
			mov 	dx, offset tarpas
			int 	21h
			call 	Proc_Ar_Rasymas_I_Faila_Sekmingas
			pop 	cx

			call 	Proc_Komandos_Vardo_Irasymas_I_Faila

			call 	Proc_Tarpo_Rasymas_I_Faila

			mov 	ah, byte ptr[poslinkio_vb_reiksme]
			mov 	al, byte ptr[poslinkio_jb_reiksme]

			add 	ax, di

			mov 	dx, ax

			mov 	al, dh
			call 	Proc_Al_Baitas_I_Buferi
			call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila
			mov 	al, dl
			call 	Proc_Al_Baitas_I_Buferi
			call 	Proc_Rez_Buff_Baito_Irasymas_I_Faila

			call 	Proc_H_Raides_Rasymas_I_Faila

			ret
		Proc_Formatas_19 endp
	;suskleidimui7

end start
