module data.linker;

import data.address;

/*
	You have to do it like this because the linker will put the variable at the address.
	*It will not set the address as a value of the variable.*
*/
private extern (C) extern __gshared {
	ubyte KERNEL_LMA;
	ubyte KERNEL_VMA;
	ubyte KERNEL_END;
	ubyte PML4;
}

static struct Linker {
public:
	@property static PhysAddress kernelPhysStart() {
		return PhysAddress(&KERNEL_LMA);
	}

	@property static VirtAddress kernelStart() {
		return VirtAddress(&KERNEL_VMA);
	}

	@property static VirtAddress kernelEnd() {
		return VirtAddress(&KERNEL_END);
	}

	@property static VirtAddress pml4() {
		return VirtAddress(&PML4);
	}
}
