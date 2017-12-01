if(WIN32 OR CYGWIN)
  set(LLVM_LINK_COMPONENTS Core Support)
endif()

add_llvm_loadable_module( LLVMCudaAdvisor
  LLVM_advisor.cpp

  DEPENDS
  intrinsics_gen
  PLUGIN_TOOL
  opt
  )
