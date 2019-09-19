; ------------------------ STRINGS --------------------------------
IDENT			db 'NBin'
Version		dd 0x0001	; increase after publication only
EntryPoint		dd real_main_startpoint
CodeSize		dd code_size
RVAData		dd RVA_data
RVADataSize		dd RVA_data_size
