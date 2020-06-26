#
# efi-x64.mk
# Peter Jones, 2019-11-13 14:27
#
ifeq ($(EFI_ARCH),x64)

ifeq ($(EFI_HOSTARCH),ia32)
EFI_ARCH_3264 := -m64
else
EFI_ARCH_3264 :=
endif
EFI_ARCH_CAN_DISABLE_AVX := $(shell $(EFI_CC) -Werror -c -o /dev/null -xc -mno-avx - </dev/null >/dev/null 2>&1 && echo -mno-avx)
EFI_ARCH_CLANG_BUGS := $(if $(findstring gcc,$(EFI_CC)),-maccumulate-outgoing-args,)

EFI_ARCH_CFLAGS := -mno-mmx -mno-sse -mno-red-zone \
		   $(EFI_ARCH_3264) \
		   $(EFI_ARCH_CAN_DISABLE_AVX) \
		   $(EFI_ARCH_CLANG_BUGS) \
		   -DEFI_FUNCTION_WRAPPER -DGNU_EFI_USE_MS_ABI \
		   -DPAGE_SIZE=4096 -DPAGE_SHIFT=12
EFI_ARCH_LDFLAGS := --no-ld-generated-unwind-info
EFI_ARCH_FORMAT := --target efi-app-$(EFI_BFDARCH)
EFI_ARCH_SUFFIX := x64
EFI_ARCH_SUFFIX_UPPER := X64
EFI_ARCH_TIMESTAMP_LOCATION := 136

export EFI_ARCH_CFLAGS EFI_ARCH_CPPFLAGS EFI_ARCH_LDFLAGS
export EFI_ARCH_FORMAT EFI_ARCH_SUBSYSTEM EFI_ARCH_SUFFIX EFI_ARCH_SUFFIX_UPPER
export EFI_ARCH_TIMESTAMP_LOCATION EFI_ARCH_3264
export EFI_ARCH_CLANG_BUGS EFI_ARCH_CAN_DISABLE_AVX
endif
