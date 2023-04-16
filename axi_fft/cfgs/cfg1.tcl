global ad_project_params

set ad_project_params(NFFT) 3
set ad_project_params(POINT_SIZE) 8
set ad_project_params(N_ELEMENTS) 16
set ad_project_params(CONFIG_NUM_BYTES) 1

# 0x0100 and 0x0140
set ad_project_params(ADDR_INPUT_START) 256
set ad_project_params(ADDR_OUTPUT_START) 320

set axi_fft [list \
  NFFT 3 \
  PERI_ID 0 \
  IDENT 0x46465443 \
  SCALE_SCH_WIDTH 4 \
  CONFIG_WIDTH 8 \
]