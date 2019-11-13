#
# efi-mips64el.mk
# Peter Jones, 2019-11-13 14:27
#
ifeq ($(EFI_ARCH),mips64el)

EFI_ARCH_3264 := -mabi=64

EFI_ARCH_CFLAGS := -march=mips64r2 $(EFI_ARCH_3264) \
		   -DPAGE_SIZE=4096 -DPAGE_SHIFT=12
EFI_ARCH_LDFLAGS :=
EFI_ARCH_FORMAT := --target efi-app-$(EFI_BFDARCH)
EFI_ARCH_SUFFIX := mips64el
EFI_ARCH_SUFFIX_UPPER := MIPS64EL
# XXX I have no idea if this is right
EFI_ARCH_TIMESTAMP_LOCATION := 136
EFI_ARCH_HAVE_OBJCOPY := y

export EFI_ARCH_CFLAGS EFI_ARCH_CPPFLAGS EFI_ARCH_LDFLAGS
export EFI_ARCH_FORMAT EFI_ARCH_SUBSYSTEM EFI_ARCH_SUFFIX EFI_ARCH_SUFFIX_UPPER
export EFI_ARCH_TIMESTAMP_LOCATION EFI_ARCH_3264 EFI_ARCH_HAVE_OBJCOPY
endif
