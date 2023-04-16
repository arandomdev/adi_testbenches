global ad_project_params

set ad_project_params(NFFT) 6
set ad_project_params(POINT_SIZE) 64
set ad_project_params(N_ELEMENTS) 128
set ad_project_params(CONFIG_NUM_BYTES) 1

# 0x0100 and 0x0300
set ad_project_params(ADDR_INPUT_START) 256
set ad_project_params(ADDR_OUTPUT_START) 768

set axi_fft [list \
  NFFT 6 \
  PERI_ID 0 \
  IDENT 0x46465443 \
  SCALE_SCH_WIDTH 6 \
  CONFIG_WIDTH 8 \
]