global ad_project_params

set axi_fft [list \
  NFFT 3 \
  PERI_ID 0 \
  IDENT 0x46465443 \
  SCALE_SCH_WIDTH 4 \
  CONFIG_WIDTH 8 \
]

set xfft [list \
  transform_length 8 \
  implementation_options pipelined_streaming_io \
  run_time_configurable_transform_length false \
  data_format floating_point \
  output_ordering natural_order \
  aresetn true \
]