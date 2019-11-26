module legion_fortran_object_oriented
  use, intrinsic :: iso_c_binding
  use legion_fortran_types
  use legion_fortran_c_interface
  implicit none
  
  include "legion_f.h"
  
  interface assert_ne
    module procedure assert_ne_integer4
    module procedure assert_ne_integer8
    module procedure assert_ne_logical
  end interface
  
contains
  ! ===============================================================================
  ! assert
  ! ===============================================================================
  subroutine assert_ne_integer4(a, b)
    implicit none
    
    integer(kind=4), intent(in) :: a
    integer(kind=4), intent(in) :: b
    
    if (a .eq. b) then
      print *, "[ERROR] Assert not equal failed", a, b
      call exit(1)
    end if  
  end subroutine assert_ne_integer4
  
  subroutine assert_ne_integer8(a, b)
    implicit none
    
    integer(kind=8), intent(in) :: a
    integer(kind=8), intent(in) :: b
    
    if (a .eq. b) then
      print *, "[ERROR] Assert not equal failed", a, b
      call exit(1)
    end if  
  end subroutine assert_ne_integer8
  
  subroutine assert_ne_logical(a, b)
    implicit none
    
    logical, intent(in) :: a
    logical, intent(in) :: b
    
    if (a .eqv. b) then
      print *, "[ERROR] Assert not equal failed", a, b
      call exit(1)
    end if  
  end subroutine assert_ne_logical
  
  ! ===============================================================================
  ! Predicate
  ! ===============================================================================
  function legion_predicate_constructor(flag)
    implicit none
    
    type(FPredicate)    :: legion_predicate_constructor
    logical, intent(in) :: flag
    
    if (flag) then
      legion_predicate_constructor%predicate = legion_predicate_true_c()
    else
      legion_predicate_constructor%predicate = legion_predicate_false_c()
    endif
  end function legion_predicate_constructor
  
  ! ===============================================================================
  ! DomainPoint
  ! ===============================================================================
  function legion_domain_point_constructor_point_1d(point)
    implicit none
    
    type(FDomainPoint)         :: legion_domain_point_constructor_point_1d
    type(FPoint1D), intent(in) :: point
      
    legion_domain_point_constructor_point_1d%point = legion_domain_point_from_point_1d_c(point%point)
  end function legion_domain_point_constructor_point_1d
  
  function legion_domain_point_constructor_point_2d(point)
    implicit none
    
    type(FDomainPoint)         :: legion_domain_point_constructor_point_2d
    type(FPoint2D), intent(in) :: point
      
    legion_domain_point_constructor_point_2d%point = legion_domain_point_from_point_2d_c(point%point)
  end function legion_domain_point_constructor_point_2d
  
  function legion_domain_point_constructor_point_3d(point)
    implicit none
    
    type(FDomainPoint)         :: legion_domain_point_constructor_point_3d
    type(FPoint3D), intent(in) :: point
      
    legion_domain_point_constructor_point_3d%point = legion_domain_point_from_point_3d_c(point%point)
  end function legion_domain_point_constructor_point_3d
  
  function legion_domain_point_get_point_1d(this)
    implicit none
    
    type(FPoint1D)                  :: legion_domain_point_get_point_1d
    class(FDomainPoint), intent(in) :: this
    
    if (this%point%dim .ne. 1) then
      print *, "Wrong DIM 1", this%point%dim 
    end if
    legion_domain_point_get_point_1d%point = legion_domain_point_get_point_1d_c(this%point)
  end function legion_domain_point_get_point_1d
  
  function legion_domain_point_get_point_2d(this)
    implicit none
    
    type(FPoint2D)                  :: legion_domain_point_get_point_2d
    class(FDomainPoint), intent(in) :: this
    
    if (this%point%dim .ne. 2) then
      print *, "Wrong DIM 2", this%point%dim 
    end if
    legion_domain_point_get_point_2d%point = legion_domain_point_get_point_2d_c(this%point)
  end function legion_domain_point_get_point_2d
  
  function legion_domain_point_get_point_3d(this)
    implicit none
    
    type(FPoint3D)                  :: legion_domain_point_get_point_3d
    class(FDomainPoint), intent(in) :: this
    
    if (this%point%dim .ne. 3) then
      print *, "Wrong DIM 3", this%point%dim 
    end if
    legion_domain_point_get_point_3d%point = legion_domain_point_get_point_3d_c(this%point)
  end function legion_domain_point_get_point_3d  
  
  ! ===============================================================================
  ! Point
  ! ===============================================================================
  function legion_point_1d_constructor_integer4(x)
    implicit none
    
    type(FPoint1D)              :: legion_point_1d_constructor_integer4
    integer(kind=4), intent(in) :: x
    
    legion_point_1d_constructor_integer4%point%x(0) = int(x, 8)
      
  end function legion_point_1d_constructor_integer4
  
  function legion_point_1d_constructor_integer8(x)
    implicit none
    
    type(FPoint1D)              :: legion_point_1d_constructor_integer8
    integer(kind=8), intent(in) :: x
    
    legion_point_1d_constructor_integer8%point%x(0) = x
      
  end function legion_point_1d_constructor_integer8
  
  function legion_point_2d_constructor_integer4(x, y)
    implicit none
    
    type(FPoint2D)              :: legion_point_2d_constructor_integer4
    integer(kind=4), intent(in) :: x
    integer(kind=4), intent(in) :: y
    
    legion_point_2d_constructor_integer4%point%x(0) = int(x, 8)
    legion_point_2d_constructor_integer4%point%x(1) = int(y, 8)
      
  end function legion_point_2d_constructor_integer4
  
  function legion_point_2d_constructor_integer8(x, y)
    implicit none
    
    type(FPoint2D)              :: legion_point_2d_constructor_integer8
    integer(kind=8), intent(in) :: x
    integer(kind=8), intent(in) :: y
    
    legion_point_2d_constructor_integer8%point%x(0) = x
    legion_point_2d_constructor_integer8%point%x(1) = y
      
  end function legion_point_2d_constructor_integer8
  
  function legion_point_3d_constructor_integer4(x, y, z)
    implicit none
    
    type(FPoint3D)              :: legion_point_3d_constructor_integer4
    integer(kind=4), intent(in) :: x
    integer(kind=4), intent(in) :: y
    integer(kind=4), intent(in) :: z
    
    legion_point_3d_constructor_integer4%point%x(0) = int(x, 8)
    legion_point_3d_constructor_integer4%point%x(1) = int(y, 8)
    legion_point_3d_constructor_integer4%point%x(2) = int(z, 8)
      
  end function legion_point_3d_constructor_integer4
  
  function legion_point_3d_constructor_integer8(x, y, z)
    implicit none
    
    type(FPoint3D)              :: legion_point_3d_constructor_integer8
    integer(kind=8), intent(in) :: x
    integer(kind=8), intent(in) :: y
    integer(kind=8), intent(in) :: z
    
    legion_point_3d_constructor_integer8%point%x(0) = x
    legion_point_3d_constructor_integer8%point%x(1) = y
    legion_point_3d_constructor_integer8%point%x(2) = z
      
  end function legion_point_3d_constructor_integer8
  
  ! ===============================================================================
  ! Rect
  ! ===============================================================================
  function legion_rect_1d_constructor_integer4(x, y)
    implicit none
    
    type(FRect1D)               :: legion_rect_1d_constructor_integer4
    integer(kind=4), intent(in) :: x
    integer(kind=4), intent(in) :: y
    
    legion_rect_1d_constructor_integer4%rect%lo%x(0) = x
    legion_rect_1d_constructor_integer4%rect%hi%x(0) = y
  end function legion_rect_1d_constructor_integer4
  
  function legion_rect_1d_constructor_integer8(x, y)
    implicit none
    
    type(FRect1D)               :: legion_rect_1d_constructor_integer8
    integer(kind=8), intent(in) :: x
    integer(kind=8), intent(in) :: y
    
    legion_rect_1d_constructor_integer8%rect%lo%x(0) = x
    legion_rect_1d_constructor_integer8%rect%hi%x(0) = y
  end function legion_rect_1d_constructor_integer8
  
  function legion_rect_1d_constructor_point_1d(x, y)
    implicit none
    
    type(FRect1D)              :: legion_rect_1d_constructor_point_1d
    type(FPoint1D), intent(in) :: x
    type(FPoint1D), intent(in) :: y
    
    legion_rect_1d_constructor_point_1d%rect%lo = x%point
    legion_rect_1d_constructor_point_1d%rect%hi = y%point
  end function legion_rect_1d_constructor_point_1d
  
  function legion_rect_2d_constructor_point_2d(x, y)
    implicit none
    
    type(FRect2D)              :: legion_rect_2d_constructor_point_2d
    type(FPoint2D), intent(in) :: x
    type(FPoint2D), intent(in) :: y
    
    legion_rect_2d_constructor_point_2d%rect%lo = x%point
    legion_rect_2d_constructor_point_2d%rect%hi = y%point
  end function legion_rect_2d_constructor_point_2d
  
  function legion_rect_3d_constructor_point_3d(x, y)
    implicit none
    
    type(FRect3D)              :: legion_rect_3d_constructor_point_3d
    type(FPoint3D), intent(in) :: x
    type(FPoint3D), intent(in) :: y
    
    legion_rect_3d_constructor_point_3d%rect%lo = x%point
    legion_rect_3d_constructor_point_3d%rect%hi = y%point
  end function legion_rect_3d_constructor_point_3d
  
  subroutine legion_rect_1d_assignment_from_domain(rect, domain)
    implicit none
    
    type(FRect1D), intent(out) :: rect
    type(FDomain), intent(in) :: domain
      
    rect%rect = legion_domain_get_rect_1d_c(domain%domain)
  end subroutine legion_rect_1d_assignment_from_domain
  
  subroutine legion_rect_2d_assignment_from_domain(rect, domain)
    implicit none
    
    type(FRect2D), intent(out) :: rect
    type(FDomain), intent(in) :: domain
      
    rect%rect = legion_domain_get_rect_2d_c(domain%domain)
  end subroutine legion_rect_2d_assignment_from_domain
  
  subroutine legion_rect_3d_assignment_from_domain(rect, domain)
    implicit none
    
    type(FRect3D), intent(out) :: rect
    type(FDomain), intent(in) :: domain
      
    rect%rect = legion_domain_get_rect_3d_c(domain%domain)
  end subroutine legion_rect_3d_assignment_from_domain
  
  function legion_domain_get_volume(this)
    implicit none
    
    integer(kind=8)            :: legion_domain_get_volume
    class(FDomain), intent(in) :: this
    
    legion_domain_get_volume = legion_domain_get_volume_c(this%domain)
  end function legion_domain_get_volume
  
  function legion_rect_1d_get_volume(this)
    implicit none
    
    integer(kind=8)            :: legion_rect_1d_get_volume
    class(FRect1D), intent(in) :: this
    
    type(legion_domain_f_t) :: domain
    domain = legion_domain_from_rect_1d_c(this%rect)
    legion_rect_1d_get_volume = legion_domain_get_volume_c(domain)
  end function legion_rect_1d_get_volume
  
  function legion_rect_2d_get_volume(this)
    implicit none
    
    integer(kind=8)            :: legion_rect_2d_get_volume
    class(FRect2D), intent(in) :: this
    
    type(legion_domain_f_t) :: domain
    domain = legion_domain_from_rect_2d_c(this%rect)
    legion_rect_2d_get_volume = legion_domain_get_volume_c(domain)
  end function legion_rect_2d_get_volume
  
  function legion_rect_3d_get_volume(this)
    implicit none
    
    integer(kind=8)            :: legion_rect_3d_get_volume
    class(FRect3D), intent(in) :: this
    
    type(legion_domain_f_t) :: domain
    domain = legion_domain_from_rect_3d_c(this%rect)
    legion_rect_3d_get_volume = legion_domain_get_volume_c(domain)
  end function legion_rect_3d_get_volume

  ! ===============================================================================
  ! FieldAccessor
  ! ===============================================================================
  function legion_field_accessor_1d_constructor(physical_region, fid, priv, data_size)
    implicit none
    
    type(FFieldAccessor1D)            :: legion_field_accessor_1d_constructor
    type(FPhysicalRegion), intent(in) :: physical_region
    integer, intent(in)               :: fid
    integer(c_int), intent(in)        :: priv
    integer(c_size_t), intent(in)     :: data_size
    

    legion_field_accessor_1d_constructor%dim = 1
    legion_field_accessor_1d_constructor%data_size = data_size
    legion_field_accessor_1d_constructor%privilege_mode = priv
    legion_field_accessor_1d_constructor%accessor = legion_physical_region_get_field_accessor_array_1d_c(physical_region%pr, fid)
  end function legion_field_accessor_1d_constructor
  
  function legion_field_accessor_2d_constructor(physical_region, fid, priv, data_size)
    implicit none
    
    type(FFieldAccessor2D)            :: legion_field_accessor_2d_constructor
    type(FPhysicalRegion), intent(in) :: physical_region
    integer, intent(in)               :: fid
    integer(c_int), intent(in)        :: priv
    integer(c_size_t), intent(in)     :: data_size
    

    legion_field_accessor_2d_constructor%dim = 2
    legion_field_accessor_2d_constructor%data_size = data_size
    legion_field_accessor_2d_constructor%privilege_mode = priv
    legion_field_accessor_2d_constructor%accessor = legion_physical_region_get_field_accessor_array_2d_c(physical_region%pr, fid)
  end function legion_field_accessor_2d_constructor
  
  function legion_field_accessor_3d_constructor(physical_region, fid, priv, data_size)
    implicit none
    
    type(FFieldAccessor3D)            :: legion_field_accessor_3d_constructor
    type(FPhysicalRegion), intent(in) :: physical_region
    integer, intent(in)               :: fid
    integer(c_int), intent(in)        :: priv
    integer(c_size_t), intent(in)     :: data_size
    

    legion_field_accessor_3d_constructor%dim = 3
    legion_field_accessor_3d_constructor%data_size = data_size
    legion_field_accessor_3d_constructor%privilege_mode = priv
    legion_field_accessor_3d_constructor%accessor = legion_physical_region_get_field_accessor_array_3d_c(physical_region%pr, fid)
  end function legion_field_accessor_3d_constructor
  
  subroutine legion_field_accessor_read_point_ptr(this, point, dst)
    implicit none
    
    class(FFieldAccessor), intent(in) :: this
    class(FPoint), intent(in)         :: point
    type(c_ptr)                       :: dst 
      
    call assert_ne(this%privilege_mode, WRITE_DISCARD)
    
    select type (this)
    type is (FFieldAccessor1D)
      ! 1D
      select type (point)
      type is (FPoint1D)
        call legion_accessor_array_1d_read_point_c(this%accessor, point%point, dst, this%data_size)
      end select
    type is (FFieldAccessor2D)
      ! 2D
      select type (point)
      type is (FPoint2D)
        call legion_accessor_array_2d_read_point_c(this%accessor, point%point, dst, this%data_size)
      end select
    type is (FFieldAccessor3D)
      ! 3D
      select type (point)
      type is (FPoint3D)
        call legion_accessor_array_3d_read_point_c(this%accessor, point%point, dst, this%data_size)
      end select
    class default
      ! give error for unexpected/unsupported type
      stop 'initialize: unexpected type for LegionFieldAccessor object!'
    end select
  end subroutine legion_field_accessor_read_point_ptr
  
  subroutine legion_field_accessor_read_point_integer4(this, point, dst)
    implicit none
    
    class(FFieldAccessor), intent(in)    :: this
    class(FPoint), intent(in)            :: point
    integer(kind=4), target, intent(out) :: dst
    
    call legion_field_accessor_read_point_ptr(this, point, c_loc(dst))
  end subroutine legion_field_accessor_read_point_integer4
  
  subroutine legion_field_accessor_read_point_integer8(this, point, dst)
    implicit none
    
    class(FFieldAccessor), intent(in)    :: this
    class(FPoint), intent(in)            :: point
    integer(kind=8), target, intent(out) :: dst
    
    call legion_field_accessor_read_point_ptr(this, point, c_loc(dst))
  end subroutine legion_field_accessor_read_point_integer8
  
  subroutine legion_field_accessor_read_point_real4(this, point, dst)
    implicit none
    
    class(FFieldAccessor), intent(in) :: this
    class(FPoint), intent(in)         :: point
    real(kind=4), target, intent(out) :: dst
    
    call legion_field_accessor_read_point_ptr(this, point, c_loc(dst))
  end subroutine legion_field_accessor_read_point_real4
  
  subroutine legion_field_accessor_read_point_real8(this, point, dst)
    implicit none
    
    class(FFieldAccessor), intent(in) :: this
    class(FPoint), intent(in)         :: point
    real(kind=8), target, intent(out) :: dst
    
    call legion_field_accessor_read_point_ptr(this, point, c_loc(dst))
  end subroutine legion_field_accessor_read_point_real8
  
  subroutine legion_field_accessor_read_point_complex4(this, point, dst)
    implicit none
    
    class(FFieldAccessor), intent(in)    :: this
    class(FPoint), intent(in)            :: point
    complex(kind=4), target, intent(out) :: dst
    
    call legion_field_accessor_read_point_ptr(this, point, c_loc(dst))
  end subroutine legion_field_accessor_read_point_complex4
  
  subroutine legion_field_accessor_read_point_complex8(this, point, dst)
    implicit none
    
    class(FFieldAccessor), intent(in)    :: this
    class(FPoint), intent(in)            :: point
    complex(kind=8), target, intent(out) :: dst
    
    call legion_field_accessor_read_point_ptr(this, point, c_loc(dst))
  end subroutine legion_field_accessor_read_point_complex8
    
  subroutine legion_field_accessor_write_point_ptr(this, point, src)
    implicit none

    class(FFieldAccessor), intent(in) :: this
    class(FPoint), intent(in)         :: point
    type(c_ptr), intent(in)           :: src
    
    call assert_ne(this%privilege_mode, READ_ONLY)
    
    select type (this)
    type is (FFieldAccessor1D)
      ! 1D
      select type (point)
      type is (FPoint1D)
        call legion_accessor_array_1d_write_point_c(this%accessor, point%point, src, this%data_size)
      end select
    type is (FFieldAccessor2D)
      ! 2D
      select type (point)
      type is (FPoint2D)
        call legion_accessor_array_2d_write_point_c(this%accessor, point%point, src, this%data_size)
      end select
    type is (FFieldAccessor3D)
      ! 3D
      select type (point)
      type is (FPoint3D)
        call legion_accessor_array_3d_write_point_c(this%accessor, point%point, src, this%data_size)
      end select
    class default
      ! give error for unexpected/unsupported type
         stop 'initialize: unexpected type for LegionFieldAccessor object!'
    end select
  end subroutine legion_field_accessor_write_point_ptr
  
  subroutine legion_field_accessor_write_point_integer4(this, point, src)
    implicit none

    class(FFieldAccessor), intent(in)   :: this
    class(FPoint), intent(in)           :: point
    integer(kind=4), target, intent(in) :: src
    
    call legion_field_accessor_write_point_ptr(this, point, c_loc(src))
  end subroutine legion_field_accessor_write_point_integer4
  
  subroutine legion_field_accessor_write_point_integer8(this, point, src)
    implicit none

    class(FFieldAccessor), intent(in)   :: this
    class(FPoint), intent(in)           :: point
    integer(kind=8), target, intent(in) :: src
    
    call legion_field_accessor_write_point_ptr(this, point, c_loc(src))
  end subroutine legion_field_accessor_write_point_integer8
  
  subroutine legion_field_accessor_write_point_real4(this, point, src)
    implicit none

    class(FFieldAccessor), intent(in) :: this
    class(FPoint), intent(in)         :: point
    real(kind=4), target, intent(in)  :: src
    
    call legion_field_accessor_write_point_ptr(this, point, c_loc(src))
  end subroutine legion_field_accessor_write_point_real4
  
  subroutine legion_field_accessor_write_point_real8(this, point, src)
    implicit none

    class(FFieldAccessor), intent(in) :: this
    class(FPoint), intent(in)         :: point
    real(kind=8), target, intent(in)  :: src
    
    call legion_field_accessor_write_point_ptr(this, point, c_loc(src))
  end subroutine legion_field_accessor_write_point_real8
  
  subroutine legion_field_accessor_write_point_complex4(this, point, src)
    implicit none

    class(FFieldAccessor), intent(in)   :: this
    class(FPoint), intent(in)           :: point
    complex(kind=4), target, intent(in) :: src
    
    call legion_field_accessor_write_point_ptr(this, point, c_loc(src))
  end subroutine legion_field_accessor_write_point_complex4
  
  subroutine legion_field_accessor_write_point_complex8(this, point, src)
    implicit none

    class(FFieldAccessor), intent(in)   :: this
    class(FPoint), intent(in)           :: point
    complex(kind=8), target, intent(in) :: src
    
    call legion_field_accessor_write_point_ptr(this, point, c_loc(src))
  end subroutine legion_field_accessor_write_point_complex8
  
  subroutine legion_field_accessor_1d_get_raw_ptr(this, rect, subrect, offset, raw_ptr)
    implicit none

    class(FFieldAccessor1D), intent(in) :: this
    type(FRect1D), intent(in)           :: rect
    type(FRect1D), intent(out)          :: subrect
    integer, intent(out)                :: offset
    type(c_ptr), intent(out)            :: raw_ptr
    
    type(legion_byte_offset_f_t) :: tmp_offset
      
    raw_ptr = legion_accessor_array_1d_raw_rect_ptr_c(this%accessor, rect%rect, &
                subrect%rect, tmp_offset)
    offset = tmp_offset%offset
  end subroutine legion_field_accessor_1d_get_raw_ptr
  
  subroutine legion_field_accessor_2d_get_raw_ptr(this, rect, subrect, offset, raw_ptr)
    implicit none

    class(FFieldAccessor2D), intent(in) :: this
    type(FRect2D), intent(in)           :: rect
    type(FRect2D), intent(out)          :: subrect
    integer, intent(out)                :: offset(2)
    type(c_ptr), intent(out)            :: raw_ptr
    
    type(legion_byte_offset_f_t) :: tmp_offset(2)
      
    raw_ptr = legion_accessor_array_2d_raw_rect_ptr_c(this%accessor, rect%rect, &
                subrect%rect, tmp_offset)
    offset(1) = tmp_offset(1)%offset
    offset(2) = tmp_offset(2)%offset
  end subroutine legion_field_accessor_2d_get_raw_ptr
  
  subroutine legion_field_accessor_3d_get_raw_ptr(this, rect, subrect, offset, raw_ptr)
    implicit none

    class(FFieldAccessor3D), intent(in) :: this
    type(FRect3D), intent(in)           :: rect
    type(FRect3D), intent(out)          :: subrect
    integer, intent(out)                :: offset(3)
    type(c_ptr), intent(out)            :: raw_ptr
    
    type(legion_byte_offset_f_t) :: tmp_offset(3)
      
    raw_ptr = legion_accessor_array_3d_raw_rect_ptr_c(this%accessor, rect%rect, &
                subrect%rect, tmp_offset)
    offset(1) = tmp_offset(1)%offset
    offset(2) = tmp_offset(2)%offset
    offset(3) = tmp_offset(3)%offset
  end subroutine legion_field_accessor_3d_get_raw_ptr
  
  ! ===============================================================================
  ! DomainPointIterator
  ! ===============================================================================
  function legion_domain_point_iterator_constructor_from_domain(handle)
    implicit none
    
    type(FDomainPointIterator) :: legion_domain_point_iterator_constructor_from_domain
    class(FDomain), intent(in) :: handle
      
    legion_domain_point_iterator_constructor_from_domain%iterator = &
      legion_domain_point_iterator_create_c(handle%domain)
  end function legion_domain_point_iterator_constructor_from_domain
  
  function legion_domain_point_iterator_constructor_from_rect_1d(handle)
    implicit none
    
    type(FDomainPointIterator) :: legion_domain_point_iterator_constructor_from_rect_1d
    class(FRect1D), intent(in) :: handle
      
    type(legion_domain_f_t) :: domain
    
    domain = legion_domain_from_rect_1d_c(handle%rect)  
    legion_domain_point_iterator_constructor_from_rect_1d%iterator = &
      legion_domain_point_iterator_create_c(domain)
  end function legion_domain_point_iterator_constructor_from_rect_1d
  
  function legion_domain_point_iterator_constructor_from_rect_2d(handle)
    implicit none
    
    type(FDomainPointIterator) :: legion_domain_point_iterator_constructor_from_rect_2d
    class(FRect2D), intent(in) :: handle
      
    type(legion_domain_f_t) :: domain
    
    domain = legion_domain_from_rect_2d_c(handle%rect)  
    legion_domain_point_iterator_constructor_from_rect_2d%iterator = &
      legion_domain_point_iterator_create_c(domain)
  end function legion_domain_point_iterator_constructor_from_rect_2d
  
  function legion_domain_point_iterator_constructor_from_rect_3d(handle)
    implicit none
    
    type(FDomainPointIterator) :: legion_domain_point_iterator_constructor_from_rect_3d
    class(FRect3D), intent(in) :: handle
      
    type(legion_domain_f_t) :: domain
    
    domain = legion_domain_from_rect_3d_c(handle%rect)  
    legion_domain_point_iterator_constructor_from_rect_3d%iterator = &
      legion_domain_point_iterator_create_c(domain)
  end function legion_domain_point_iterator_constructor_from_rect_3d
  
  subroutine legion_domain_point_iterator_destructor(this)
    implicit none
    
    class(FDomainPointIterator), intent(in) :: this
    call legion_domain_point_iterator_destroy_c(this%iterator)
  end subroutine legion_domain_point_iterator_destructor
  
  function legion_domain_point_iterator_has_next(this)
    implicit none
    
    logical                                :: legion_domain_point_iterator_has_next
    class(FDomainPointIterator), intent(in) :: this
    
    legion_domain_point_iterator_has_next = legion_domain_point_iterator_has_next_c(this%iterator)
  end function legion_domain_point_iterator_has_next
  
  function legion_domain_point_iterator_step(this)
    implicit none
    
    type(FDomainPoint) :: legion_domain_point_iterator_step
    class(FDomainPointIterator), intent(in) :: this
    
    legion_domain_point_iterator_step%point = legion_domain_point_iterator_next_c(this%iterator)
  end function legion_domain_point_iterator_step
  
  ! ===============================================================================
  ! FieldAllocator
  ! ===============================================================================
  subroutine legion_field_allocator_allocate_field(this, field_size, desired_fieldid)
    implicit none
    
    class(FFieldAllocator), intent(in) :: this
    integer(c_size_t), intent(in)      :: field_size
    integer, intent(in)                :: desired_fieldid
    
    integer                            :: tmp_fid
    
    tmp_fid = legion_field_allocator_allocate_field_c(this%fa, field_size, desired_fieldid)
    if (tmp_fid == desired_fieldid) then
    else
      print *, "Field_ID allocate error", desired_fieldid, tmp_fid
      call exit(0)
    end if
  end subroutine legion_field_allocator_allocate_field
  
  subroutine legion_field_allocator_free_field(this, fid)
    implicit none
    
    class(FFieldAllocator), intent(in) :: this
    integer, intent(in)                :: fid
    
    call legion_field_allocator_free_field_c(this%fa, fid)
  end subroutine legion_field_allocator_free_field
  
  subroutine legion_field_allocator_destroy(this)
    implicit none
    
    class(FFieldAllocator), intent(in) :: this
    
    call legion_field_allocator_destroy_c(this%fa)
  end subroutine legion_field_allocator_destroy
  
  ! ===============================================================================
  ! LogicalRegion
  ! ===============================================================================
  function legion_logical_region_get_index_space(this)
    implicit none
    
    type(FIndexSpace)                 :: legion_logical_region_get_index_space 
    class(FLogicalRegion), intent(in) :: this
    
    legion_logical_region_get_index_space%is = legion_logical_region_get_index_space_c(this%lr)
  end function legion_logical_region_get_index_space
  
  ! ===============================================================================
  ! PhysicalRegion
  ! ===============================================================================
  subroutine legion_physical_region_destructor(this)
    implicit none
    
    class(FPhysicalRegion), intent(in) :: this
      
    call legion_physical_region_destroy_c(this%pr)
  end subroutine legion_physical_region_destructor
  
  function legion_physical_region_is_mapped(this)
    implicit none
    
    logical                            :: legion_physical_region_is_mapped
    class(FPhysicalRegion), intent(in) :: this
      
    legion_physical_region_is_mapped = legion_physical_region_is_mapped_c(this%pr)
  end function legion_physical_region_is_mapped
  
  subroutine legion_physical_region_wait_until_valid(this)
    implicit none
    
    class(FPhysicalRegion), intent(in) :: this
      
    call legion_physical_region_wait_until_valid_c(this%pr)
  end subroutine legion_physical_region_wait_until_valid
  
  function legion_physical_region_is_valid(this)
    implicit none
    
    logical                            :: legion_physical_region_is_valid
    class(FPhysicalRegion), intent(in) :: this
      
    legion_physical_region_is_valid = legion_physical_region_is_valid_c(this%pr)
  end function legion_physical_region_is_valid
  
  ! ===============================================================================
  ! PhysicalRegionList
  ! ===============================================================================
  function legion_physical_region_list_size(this)
    implicit none
    
    type(integer)                         :: legion_physical_region_list_size
    class(FPhysicalRegionList), intent(in) :: this
      
    legion_physical_region_list_size = this%num_regions
  end function legion_physical_region_list_size
  
  function legion_physical_region_list_get_region_by_id(this, id)
    implicit none
    
    type(FPhysicalRegion)                  :: legion_physical_region_list_get_region_by_id
    class(FPhysicalRegionList), intent(in) :: this
    type(integer), intent(in)             :: id
      
    legion_physical_region_list_get_region_by_id%pr = legion_get_physical_region_by_id_c(this%region_ptr, id, this%num_regions)
  end function legion_physical_region_list_get_region_by_id
  
  ! ===============================================================================
  ! RegionRequirement
  ! ===============================================================================
  function legion_region_requirement_get_logical_region(this)
    implicit none
    
    type(FLogicalRegion)                  :: legion_region_requirement_get_logical_region
    class(FRegionRequirement), intent(in) :: this
      
    legion_region_requirement_get_logical_region%lr = legion_region_requirement_get_region_c(this%rr)
  end function legion_region_requirement_get_logical_region
  
  function legion_region_requirement_get_privilege_field_by_id(this, id)
    implicit none
    
    type(integer)                         :: legion_region_requirement_get_privilege_field_by_id
    class(FRegionRequirement), intent(in) :: this
    type(integer), intent(in)             :: id
    
    legion_region_requirement_get_privilege_field_by_id = legion_region_requirement_get_privilege_field_c(this%rr, id)
  end function legion_region_requirement_get_privilege_field_by_id
  
  ! ===============================================================================
  ! Future
  ! ===============================================================================
  function legion_future_constructor(handle)
    implicit none
    
    type(FFuture)             :: legion_future_constructor
    type(FFuture), intent(in) :: handle
      
    legion_future_constructor%future = legion_future_copy_c(handle%future)
  end function legion_future_constructor
  
  subroutine legion_future_destructor(this)
    implicit none
    
    class(FFuture), intent(in) :: this
      
    call legion_future_destroy_c(this%future)
  end subroutine legion_future_destructor
  
  subroutine legion_future_get_integer4(this, result)
    implicit none
    
    class(FFuture), intent(in)    :: this
    integer(kind=4), intent(out)  :: result
    
    type(c_ptr) :: ptr
    integer(kind=4), pointer :: f_ptr
    integer(c_size_t) :: result_size
    
    ptr = legion_future_get_untyped_pointer_c(this%future)
    call c_f_pointer(ptr, f_ptr)
    result = f_ptr
    result_size = legion_future_get_untyped_size_c(this%future)
    if (result_size .ne. c_sizeof(result)) then
      print *, "future result size error", result_size, c_sizeof(result)
    end if
  end subroutine legion_future_get_integer4
  
  subroutine legion_future_get_integer8(this, result)
    implicit none
    
    class(FFuture), intent(in)    :: this
    integer(kind=8), intent(out)  :: result
    
    type(c_ptr) :: ptr
    integer(kind=8), pointer :: f_ptr
    integer(c_size_t) :: result_size
    
    ptr = legion_future_get_untyped_pointer_c(this%future)
    call c_f_pointer(ptr, f_ptr)
    result = f_ptr
    result_size = legion_future_get_untyped_size_c(this%future)
    if (result_size .ne. c_sizeof(result)) then
      print *, "future result size error", result_size, c_sizeof(result)
    end if
  end subroutine legion_future_get_integer8
  
  subroutine legion_future_get_real4(this, result)
    implicit none
    
    class(FFuture), intent(in)    :: this
    real(kind=4), intent(out)     :: result
    
    type(c_ptr) :: ptr
    real(kind=4), pointer :: f_ptr
    integer(c_size_t) :: result_size
    
    ptr = legion_future_get_untyped_pointer_c(this%future)
    call c_f_pointer(ptr, f_ptr)
    result = f_ptr
    result_size = legion_future_get_untyped_size_c(this%future)
    if (result_size .ne. c_sizeof(result)) then
      print *, "future result size error", result_size, c_sizeof(result)
    end if
  end subroutine legion_future_get_real4
  
  subroutine legion_future_get_real8(this, result)
    implicit none
    
    class(FFuture), intent(in)    :: this
    real(kind=8), intent(out)     :: result
    
    type(c_ptr) :: ptr
    real(kind=8), pointer :: f_ptr
    integer(c_size_t) :: result_size
    
    ptr = legion_future_get_untyped_pointer_c(this%future)
    call c_f_pointer(ptr, f_ptr)
    result = f_ptr
    result_size = legion_future_get_untyped_size_c(this%future)
    if (result_size .ne. c_sizeof(result)) then
      print *, "future result size error", result_size, c_sizeof(result)
    end if
  end subroutine legion_future_get_real8
  
  subroutine legion_future_get_untyped(this, ptr, size)
    implicit none
    
    class(FFuture), intent(in)     :: this
    type(c_ptr), intent(out)       :: ptr
    integer(c_size_t), intent(out) :: size
    
    ptr = legion_future_get_untyped_pointer_c(this%future)
    size = legion_future_get_untyped_size_c(this%future)
  end subroutine legion_future_get_untyped
  
  ! ===============================================================================
  ! FutureMap
  ! ===============================================================================
  subroutine legion_future_map_wait_all_results(this)
    implicit none
    
    class(FFutureMap), intent(in) :: this
    
    call legion_future_map_wait_all_results_c(this%future_map)
  end subroutine legion_future_map_wait_all_results
  
  function legion_future_map_get_future_index(this, index)
    implicit none
    
    type(FFuture)                 :: legion_future_map_get_future_index
    class(FFutureMap), intent(in) :: this
    integer, intent(in)           :: index
    
    type(FPoint1D) :: pt
    type(legion_domain_point_f_t) :: dp
    
    pt = FPoint1D(index)
    dp = legion_domain_point_from_point_1d_c(pt%point)
    legion_future_map_get_future_index%future = legion_future_map_get_future_c(this%future_map, dp)
  end function legion_future_map_get_future_index
  
  function legion_future_map_get_future_domain_point(this, dp)
    implicit none
    
    type(FFuture)                  :: legion_future_map_get_future_domain_point
    class(FFutureMap), intent(in)  :: this
    type(FDomainPoint), intent(in) :: dp
    
    legion_future_map_get_future_domain_point%future = legion_future_map_get_future_c(this%future_map, dp%point)
  end function legion_future_map_get_future_domain_point
  
  function legion_future_map_get_future_point_1d(this, pt)
    implicit none
    
    type(FFuture)                 :: legion_future_map_get_future_point_1d
    class(FFutureMap), intent(in) :: this
    type(FPoint1D), intent(in)    :: pt
   
    type(legion_domain_point_f_t) :: dp
    
    dp = legion_domain_point_from_point_1d_c(pt%point)
    legion_future_map_get_future_point_1d%future = legion_future_map_get_future_c(this%future_map, dp)
  end function legion_future_map_get_future_point_1d
  
  function legion_future_map_get_future_point_2d(this, pt)
    implicit none
    
    type(FFuture)                 :: legion_future_map_get_future_point_2d
    class(FFutureMap), intent(in) :: this
    type(FPoint2D), intent(in)    :: pt
   
    type(legion_domain_point_f_t) :: dp
    
    dp = legion_domain_point_from_point_2d_c(pt%point)
    legion_future_map_get_future_point_2d%future = legion_future_map_get_future_c(this%future_map, dp)
  end function legion_future_map_get_future_point_2d
  
  function legion_future_map_get_future_point_3d(this, pt)
    implicit none
    
    type(FFuture)                 :: legion_future_map_get_future_point_3d
    class(FFutureMap), intent(in) :: this
    type(FPoint3D), intent(in)    :: pt
   
    type(legion_domain_point_f_t) :: dp
    
    dp = legion_domain_point_from_point_3d_c(pt%point)
    legion_future_map_get_future_point_3d%future = legion_future_map_get_future_c(this%future_map, dp)
  end function legion_future_map_get_future_point_3d
  
  ! ===============================================================================
  ! TaskArgument
  ! ===============================================================================
  function legion_task_argument_constructor(arg, arg_size)
    implicit none 
    
    type(FTaskArgument)                     :: legion_task_argument_constructor
    type(c_ptr), optional, intent(in)       :: arg
    integer(c_size_t), optional, intent(in) :: arg_size
    
    type(c_ptr) :: tmp_arg
    integer(c_size_t) :: tmp_arg_size
    
    tmp_arg = c_null_ptr
    tmp_arg_size = 0
    if (present(arg)) tmp_arg = arg
    if (present(arg_size)) tmp_arg_size = arg_size
    
    legion_task_argument_constructor%task_arg%args = tmp_arg
    legion_task_argument_constructor%task_arg%arglen = tmp_arg_size
  end function legion_task_argument_constructor
  
  ! ===============================================================================
  ! ArgumentMap
  ! ===============================================================================
  function legion_argument_map_constructor()
    implicit none
    
    type(FArgumentMap) :: legion_argument_map_constructor

    legion_argument_map_constructor%arg_map = legion_argument_map_create_c()
  end function legion_argument_map_constructor
  
  subroutine legion_argument_map_destructor(this)
    implicit none
    
    class(FArgumentMap), intent(in) :: this
      
    call legion_argument_map_destroy_c(this%arg_map)
  end subroutine legion_argument_map_destructor
  
  subroutine legion_argument_map_set_point_domain_point(this, dp, arg, replace)
    implicit none
    
    class(FArgumentMap), intent(in) :: this
    type(FDomainPoint), intent(in)  :: dp
    type(FTaskArgument), intent(in) :: arg
    logical, optional, intent(in)   :: replace
      
    logical(c_bool) :: tmp_replace = .true.
    
    if (present(replace)) tmp_replace = replace
    call legion_argument_map_set_point_c(this%arg_map, dp%point, arg%task_arg, tmp_replace)
  end subroutine legion_argument_map_set_point_domain_point

  subroutine legion_argument_map_set_point_integer(this, index, arg, replace)
    implicit none
    
    class(FArgumentMap), intent(in) :: this
    integer, intent(in)             :: index
    type(FTaskArgument), intent(in) :: arg
    logical, optional, intent(in)   :: replace
      
    logical(c_bool) :: tmp_replace = .true.
    type(legion_domain_point_f_t) :: dp
    
    if (present(replace)) tmp_replace = replace
    dp%dim = 1
    dp%point_data(0) = index
    call legion_argument_map_set_point_c(this%arg_map, dp, arg%task_arg, tmp_replace)
  end subroutine legion_argument_map_set_point_integer
  
  subroutine legion_argument_map_set_point_1d_point(this, point, arg, replace)
    implicit none
    
    class(FArgumentMap), intent(in) :: this
    type(FPoint1D), intent(in)      :: point
    type(FTaskArgument), intent(in) :: arg
    logical, optional, intent(in)   :: replace
      
    logical(c_bool) :: tmp_replace = .true.
    type(legion_domain_point_f_t) :: dp
    
    if (present(replace)) tmp_replace = replace
    dp = legion_domain_point_from_point_1d_c(point%point)
    call legion_argument_map_set_point_c(this%arg_map, dp, arg%task_arg, tmp_replace)
  end subroutine legion_argument_map_set_point_1d_point
  
  subroutine legion_argument_map_set_point_2d_point(this, point, arg, replace)
    implicit none
    
    class(FArgumentMap), intent(in) :: this
    type(FPoint2D), intent(in)      :: point
    type(FTaskArgument), intent(in) :: arg
    logical, optional, intent(in)   :: replace
      
    logical(c_bool) :: tmp_replace = .true.
    type(legion_domain_point_f_t) :: dp
    
    if (present(replace)) tmp_replace = replace
    dp = legion_domain_point_from_point_2d_c(point%point)
    call legion_argument_map_set_point_c(this%arg_map, dp, arg%task_arg, tmp_replace)
  end subroutine legion_argument_map_set_point_2d_point
  
  subroutine legion_argument_map_set_point_3d_point(this, point, arg, replace)
    implicit none
    
    class(FArgumentMap), intent(in) :: this
    type(FPoint3D), intent(in)      :: point
    type(FTaskArgument), intent(in) :: arg
    logical, optional, intent(in)   :: replace
      
    logical(c_bool) :: tmp_replace = .true.
    type(legion_domain_point_f_t) :: dp
    
    if (present(replace)) tmp_replace = replace
    dp = legion_domain_point_from_point_3d_c(point%point)
    call legion_argument_map_set_point_c(this%arg_map, dp, arg%task_arg, tmp_replace)
  end subroutine legion_argument_map_set_point_3d_point
  
  ! ===============================================================================
  ! TaskLauncher
  ! ===============================================================================
  function legion_task_launcher_constructor(tid, arg, pred, id, tag)
    implicit none
    
    type(FTaskLauncher)                              :: legion_task_launcher_constructor
    integer, intent(in)                              :: tid
    type(FTaskArgument), intent(in)                  :: arg
    type(legion_predicate_f_t), optional, intent(in) :: pred
    integer, optional, intent(in)                    :: id
    integer(kind=8), optional, intent(in)            :: tag
    
    type(legion_predicate_f_t) :: tmp_pred
    integer                    :: tmp_id
    integer(kind=8)            :: tmp_tag
    
    tmp_pred = legion_predicate_true_c()
    tmp_id = 0
    tmp_tag = 0
    
    if (present(pred)) tmp_pred = pred
    if (present(id)) tmp_id = id
    if (present(pred)) tmp_tag = tag
    legion_task_launcher_constructor%launcher = legion_task_launcher_create_c(tid, arg%task_arg, tmp_pred, tmp_id, tmp_tag)
  end function legion_task_launcher_constructor
  
  subroutine legion_task_launcher_destructor(this)
    implicit none
    
    class(FTaskLauncher), intent(in) :: this
    
    call legion_task_launcher_destroy_c(this%launcher)
  end subroutine legion_task_launcher_destructor
  
  subroutine legion_task_launcher_add_region_requirement(this, handle, priv, prop, parent, tag, verified)
    implicit none
    
    class(FTaskLauncher), intent(in)      :: this
    type(FLogicalRegion), intent(in)      :: handle
    integer(c_int), intent(in)            :: priv
    integer(c_int), intent(in)            :: prop
    type(FLogicalRegion), intent(in)      :: parent
    integer(kind=8), optional, intent(in) :: tag
    logical(c_bool), optional, intent(in) :: verified
    
    integer(kind=8) :: tmp_tag
    logical(c_bool) :: tmp_verified
    integer(c_int) :: rr_id
        
    tmp_tag = 0
    tmp_verified = .false.
    
    if (present(tag)) tmp_tag = tag
    if (present(verified)) tmp_verified = verified 
    rr_id = legion_task_launcher_add_region_requirement_logical_region_c(this%launcher, &
              handle%lr, priv, prop, parent%lr, tmp_tag, tmp_verified)
  end subroutine legion_task_launcher_add_region_requirement
    
  subroutine legion_task_launcher_add_field(this, idx, fid, inst)
    implicit none
    
    class(FTaskLauncher), intent(in)      :: this
    integer, intent(in)                   :: idx
    integer, intent(in)                   :: fid
    logical(c_bool), optional, intent(in) :: inst
    
    logical(c_bool) :: tmp_inst
    
    tmp_inst = .true.
    if (present(inst)) tmp_inst = inst
    
    call legion_task_launcher_add_field_c(this%launcher, idx, fid, tmp_inst)
  end subroutine legion_task_launcher_add_field
  
  subroutine legion_task_launcher_add_future(this, future)
    implicit none
    
    class(FTaskLauncher), intent(in) :: this
    type(FFuture), intent(in)        :: future
    
    call legion_task_launcher_add_future_c(this%launcher, future%future)
  end subroutine legion_task_launcher_add_future
  
  ! ===============================================================================
  ! IndexLauncher
  ! ===============================================================================
  function legion_index_launcher_constructor_from_index_space(tid, launch_space, global_arg, map, &
                                                              pred, must, id, tag)
    implicit none
    
    type(FIndexLauncher) :: legion_index_launcher_constructor_from_index_space
    integer, intent(in)                              :: tid
    type(FIndexSpace), intent(in)                    :: launch_space
    type(FTaskArgument), intent(in)                  :: global_arg
    type(FArgumentMap), intent(in)                   :: map
    type(legion_predicate_f_t), optional, intent(in) :: pred
    logical(c_bool), optional, intent(in)            :: must
    integer(c_int), optional, intent(in)             :: id
    integer(c_long), optional, intent(in)            :: tag
    
    type(legion_predicate_f_t) :: tmp_pred
    logical(c_bool) :: tmp_must
    integer(c_int) :: tmp_id
    integer(c_long) :: tmp_tag
    type(legion_domain_f_t) :: domain
    type(legion_runtime_f_t) :: runtime  
    
    tmp_pred = legion_predicate_true_c()
    tmp_must = .false.
    tmp_id = 0
    tmp_tag = 0
    
    if (present(pred)) tmp_pred = pred
    if (present(must)) tmp_must = must
    if (present(id)) tmp_id = id
    if (present(tag)) tmp_tag = tag
    
    runtime = legion_runtime_get_runtime_c()
    domain = legion_index_space_get_domain_c(runtime, launch_space%is)
    
    legion_index_launcher_constructor_from_index_space%index_launcher = &
      legion_index_launcher_create_c(tid, domain, &
        global_arg%task_arg, map%arg_map, &
        tmp_pred, tmp_must, tmp_id, tmp_tag)
  end function legion_index_launcher_constructor_from_index_space
  
  subroutine legion_index_launcher_destructor(this)
    implicit none
    
    class(FIndexLauncher), intent(in) :: this
    
    call legion_index_launcher_destroy_c(this%index_launcher)
  end subroutine legion_index_launcher_destructor
  
  subroutine legion_index_launcher_add_region_requirement_logical_partition(this, handle, proj, priv, prop, parent, tag, verified)
    implicit none
    
    class(FIndexLauncher), intent(in)     :: this
    type(FLogicalPartition), intent(in)   :: handle
    integer(c_int), intent(in)            :: proj
    integer(c_int), intent(in)            :: priv
    integer(c_int), intent(in)            :: prop
    type(FLogicalRegion), intent(in)      :: parent
    integer(kind=8), optional, intent(in) :: tag
    logical(c_bool), optional, intent(in) :: verified
    
    integer(kind=8) :: tmp_tag = 0
    logical(c_bool) :: tmp_verified = .false.
    integer(c_int) :: rr_id
    
    if (present(tag)) tmp_tag = tag
    if (present(verified)) tmp_verified = verified 
    rr_id = legion_index_launcher_add_region_requirement_lp_c(this%index_launcher, &
              handle%lp, proj, priv, prop, parent%lr, tmp_tag, tmp_verified)
  end subroutine legion_index_launcher_add_region_requirement_logical_partition
  
  subroutine legion_index_launcher_add_field(this, idx, fid, inst)
    implicit none
    
    class(FIndexLauncher), intent(in)     :: this
    integer, intent(in)                   :: idx
    integer, intent(in)                   :: fid
    logical(c_bool), optional, intent(in) :: inst
    
    logical(c_bool) :: tmp_inst = .true.
    
    if (present(inst)) tmp_inst = inst
    
    call legion_index_launcher_add_field_c(this%index_launcher, idx, fid, tmp_inst)
  end subroutine legion_index_launcher_add_field
  
  ! ===============================================================================
  ! InlineLauncher
  ! ===============================================================================
  function legion_inline_launcher_constructor(handle, priv, prop, parent, region_tag, verified, id, launcher_tag)
    implicit none
    
    type(FInlineLauncher)                 :: legion_inline_launcher_constructor
    type(FLogicalRegion), intent(in)      :: handle
    integer(c_int), intent(in)            :: priv
    integer(c_int), intent(in)            :: prop
    type(FLogicalRegion), intent(in)      :: parent
    integer(kind=8), optional, intent(in) :: region_tag
    logical(c_bool), optional, intent(in) :: verified
    integer(kind=8), optional, intent(in) :: id
    integer(kind=8), optional, intent(in) :: launcher_tag
    
    integer(kind=8) :: tmp_region_tag = 0
    logical(c_bool) :: tmp_verified = .false.
    integer(kind=8) :: tmp_id = 0
    integer(kind=8) :: tmp_launcher_tag = 0
    
    if (present(region_tag)) tmp_region_tag = region_tag
    if (present(verified)) tmp_verified = verified
    if (present(id)) tmp_id = id
    if (present(launcher_tag)) tmp_launcher_tag = launcher_tag
    
    legion_inline_launcher_constructor%inline_launcher = legion_inline_launcher_create_logical_region_c( &
      handle%lr, priv, prop, parent%lr, tmp_region_tag, tmp_verified, tmp_id, tmp_launcher_tag)
  end function legion_inline_launcher_constructor
  
  subroutine legion_inline_launcher_destructor(this)
    implicit none
    
    class(FInlineLauncher), intent(in)     :: this
    
    call legion_inline_launcher_destroy_c(this%inline_launcher)
  end subroutine legion_inline_launcher_destructor
  
  subroutine legion_inline_launcher_add_field(this, fid, inst)
    implicit none
    
    class(FInlineLauncher), intent(in)     :: this
    integer, intent(in)                   :: fid
    logical(c_bool), optional, intent(in) :: inst
    
    logical(c_bool) :: tmp_inst = .true.
    
    if (present(inst)) tmp_inst = inst
    call legion_inline_launcher_add_field_c(this%inline_launcher, fid, tmp_inst)
  end subroutine legion_inline_launcher_add_field
  
  ! ===============================================================================
  ! CopyLauncher
  ! ===============================================================================
  function legion_copy_launcher_constructor(pred, id, launcher_tag)
    implicit none
    
    type(FCopyLauncher) :: legion_copy_launcher_constructor
    type(legion_predicate_f_t), optional, intent(in) :: pred
    integer(kind=4), optional, intent(in)            :: id
    integer(kind=8), optional, intent(in)            :: launcher_tag
    
    type(legion_predicate_f_t) :: tmp_pred
    integer(kind=4) :: tmp_id = 0
    integer(kind=8) :: tmp_launcher_tag = 0
    
    tmp_pred = legion_predicate_true_c()
    if (present(pred)) tmp_pred = pred
    if (present(id)) tmp_id = id
    if (present(launcher_tag)) tmp_launcher_tag = launcher_tag
    
    legion_copy_launcher_constructor%copy_launcher = &
      legion_copy_launcher_create_c(tmp_pred, tmp_id, tmp_launcher_tag)
  end function legion_copy_launcher_constructor
  
  subroutine legion_copy_launcher_destructor(this)
    implicit none
    
    class(FCopyLauncher), intent(in) :: this
    
    call legion_copy_launcher_destroy_c(this%copy_launcher)
  end subroutine legion_copy_launcher_destructor
  
  subroutine legion_copy_launcher_add_src_requirements(this, handle, priv, &
      prop, parent, tag, verified)
    implicit none
    
    class(FCopyLauncher), intent(in)      :: this
    type(FLogicalRegion), intent(in)      :: handle
    integer, intent(in)                   :: priv
    integer, intent(in)                   :: prop
    type(FLogicalRegion), intent(in)      :: parent
    integer(kind=8), optional, intent(in) :: tag
    logical, optional, intent(in)         :: verified
    
    integer(kind=8) :: tmp_tag = 0
    logical(c_bool) :: tmp_verified = .false.
    integer :: retval
    
    if (present(tag)) tmp_tag = tag
    if (present(verified)) tmp_verified = verified
    retval = legion_copy_launcher_add_src_region_requirement_lr_c( &
      this%copy_launcher, handle%lr, priv, prop, parent%lr, tmp_tag, tmp_verified)
  end subroutine legion_copy_launcher_add_src_requirements
  
  subroutine legion_copy_launcher_add_dst_requirements(this, handle, priv, &
      prop, parent, tag, verified)
    implicit none
    
    class(FCopyLauncher), intent(in)      :: this
    type(FLogicalRegion), intent(in)      :: handle
    integer, intent(in)                   :: priv
    integer, intent(in)                   :: prop
    type(FLogicalRegion), intent(in)      :: parent
    integer(kind=8), optional, intent(in) :: tag
    logical, optional, intent(in)         :: verified
    
    integer(kind=8) :: tmp_tag = 0
    logical(c_bool) :: tmp_verified = .false.
    integer :: retval
    
    if (present(tag)) tmp_tag = tag
    if (present(verified)) tmp_verified = verified
    retval = legion_copy_launcher_add_dst_region_requirement_lr_c( &
      this%copy_launcher, handle%lr, priv, prop, parent%lr, tmp_tag, tmp_verified)
  end subroutine legion_copy_launcher_add_dst_requirements
  
  subroutine legion_copy_launcher_add_src_field(this, idx, fid, inst)
    implicit none
    
    class(FCopyLauncher), intent(in) :: this
    integer, intent(in)              :: idx
    integer, intent(in)              :: fid
    logical, optional, intent(in)    :: inst
    
    logical(c_bool) :: tmp_inst = .true.
    
    if (present(inst)) tmp_inst = inst
    call legion_copy_launcher_add_src_field_c(this%copy_launcher, idx, fid, tmp_inst)
  end subroutine legion_copy_launcher_add_src_field
  
  subroutine legion_copy_launcher_add_dst_field(this, idx, fid, inst)
    implicit none
    
    class(FCopyLauncher), intent(in) :: this
    integer, intent(in)              :: idx
    integer, intent(in)              :: fid
    logical, optional, intent(in)    :: inst
    
    logical(c_bool) :: tmp_inst = .true.
    
    if (present(inst)) tmp_inst = inst
    call legion_copy_launcher_add_dst_field_c(this%copy_launcher, idx, fid, tmp_inst)
  end subroutine legion_copy_launcher_add_dst_field
  
  ! ===============================================================================
  ! IndexCopyLauncher
  ! ===============================================================================
  function legion_index_copy_launcher_constructor(domain, pred, id, launcher_tag)
    implicit none
    
    type(FIndexCopyLauncher) :: legion_index_copy_launcher_constructor
    type(FDomain), intent(in)                        :: domain
    type(legion_predicate_f_t), optional, intent(in) :: pred
    integer(kind=4), optional, intent(in)            :: id
    integer(kind=8), optional, intent(in)            :: launcher_tag
    
    type(legion_predicate_f_t) :: tmp_pred
    integer(kind=4) :: tmp_id = 0
    integer(kind=8) :: tmp_launcher_tag = 0
    
    tmp_pred = legion_predicate_true_c()
    if (present(pred)) tmp_pred = pred
    if (present(id)) tmp_id = id
    if (present(launcher_tag)) tmp_launcher_tag = launcher_tag
    
    legion_index_copy_launcher_constructor%index_copy_launcher = &
      legion_index_copy_launcher_create_c(domain%domain, tmp_pred, tmp_id, tmp_launcher_tag)
  end function legion_index_copy_launcher_constructor
  
  subroutine legion_index_copy_launcher_destructor(this)
    implicit none
    
    class(FIndexCopyLauncher), intent(in) :: this
    
    call legion_index_copy_launcher_destroy_c(this%index_copy_launcher)
  end subroutine legion_index_copy_launcher_destructor
  
  subroutine legion_index_copy_launcher_add_src_requirements_lr(this, handle, proj, &
      priv, prop, parent, tag, verified)
    implicit none
    
    class(FIndexCopyLauncher), intent(in) :: this
    type(FLogicalRegion), intent(in)      :: handle
    integer, intent(in)                   :: proj
    integer, intent(in)                   :: priv
    integer, intent(in)                   :: prop
    type(FLogicalRegion), intent(in)      :: parent
    integer(kind=8), optional, intent(in) :: tag
    logical, optional, intent(in)         :: verified
    
    integer(kind=8) :: tmp_tag = 0
    logical(c_bool) :: tmp_verified = .false.
    integer :: retval
    
    if (present(tag)) tmp_tag = tag
    if (present(verified)) tmp_verified = verified
    retval = legion_index_copy_launcher_add_src_region_requirement_lr_c( &
      this%index_copy_launcher, handle%lr, proj, priv, prop, parent%lr, tmp_tag, tmp_verified)
  end subroutine legion_index_copy_launcher_add_src_requirements_lr
  
  subroutine legion_index_copy_launcher_add_src_requirements_lp(this, handle, proj, &
      priv, prop, parent, tag, verified)
    implicit none
    
    class(FIndexCopyLauncher), intent(in) :: this
    type(FLogicalPartition), intent(in)   :: handle
    integer, intent(in)                   :: proj
    integer, intent(in)                   :: priv
    integer, intent(in)                   :: prop
    type(FLogicalRegion), intent(in)      :: parent
    integer(kind=8), optional, intent(in) :: tag
    logical, optional, intent(in)         :: verified
    
    integer(kind=8) :: tmp_tag = 0
    logical(c_bool) :: tmp_verified = .false.
    integer :: retval
    
    if (present(tag)) tmp_tag = tag
    if (present(verified)) tmp_verified = verified
    retval = legion_index_copy_launcher_add_src_region_requirement_lp_c( &
      this%index_copy_launcher, handle%lp, proj, priv, prop, parent%lr, tmp_tag, tmp_verified)
  end subroutine legion_index_copy_launcher_add_src_requirements_lp
  
  subroutine legion_index_copy_launcher_add_dst_requirements_lr(this, handle, proj, &
      priv, prop, parent, tag, verified)
    implicit none
    
    class(FIndexCopyLauncher), intent(in) :: this
    type(FLogicalRegion), intent(in)      :: handle
    integer, intent(in)                   :: proj
    integer, intent(in)                   :: priv
    integer, intent(in)                   :: prop
    type(FLogicalRegion), intent(in)      :: parent
    integer(kind=8), optional, intent(in) :: tag
    logical, optional, intent(in)         :: verified
    
    integer(kind=8) :: tmp_tag = 0
    logical(c_bool) :: tmp_verified = .false.
    integer :: retval
    
    if (present(tag)) tmp_tag = tag
    if (present(verified)) tmp_verified = verified
    retval = legion_index_copy_launcher_add_dst_region_requirement_lr_c( &
      this%index_copy_launcher, handle%lr, proj, priv, prop, parent%lr, tmp_tag, tmp_verified)
  end subroutine legion_index_copy_launcher_add_dst_requirements_lr
  
  subroutine legion_index_copy_launcher_add_dst_requirements_lp(this, handle, proj, &
      priv, prop, parent, tag, verified)
    implicit none
    
    class(FIndexCopyLauncher), intent(in) :: this
    type(FLogicalPartition), intent(in)   :: handle
    integer, intent(in)                   :: proj
    integer, intent(in)                   :: priv
    integer, intent(in)                   :: prop
    type(FLogicalRegion), intent(in)      :: parent
    integer(kind=8), optional, intent(in) :: tag
    logical, optional, intent(in)         :: verified
    
    integer(kind=8) :: tmp_tag = 0
    logical(c_bool) :: tmp_verified = .false.
    integer :: retval
    
    if (present(tag)) tmp_tag = tag
    if (present(verified)) tmp_verified = verified
    retval = legion_index_copy_launcher_add_dst_region_requirement_lp_c( &
      this%index_copy_launcher, handle%lp, proj, priv, prop, parent%lr, tmp_tag, tmp_verified)
  end subroutine legion_index_copy_launcher_add_dst_requirements_lp
  
  subroutine legion_index_copy_launcher_add_src_field(this, idx, fid, inst)
    implicit none
    
    class(FIndexCopyLauncher), intent(in) :: this
    integer, intent(in)                   :: idx
    integer, intent(in)                   :: fid
    logical, optional, intent(in)         :: inst
    
    logical(c_bool) :: tmp_inst = .true.
    
    if (present(inst)) tmp_inst = inst
    call legion_index_copy_launcher_add_src_field_c(this%index_copy_launcher, idx, fid, tmp_inst)
  end subroutine legion_index_copy_launcher_add_src_field
  
  subroutine legion_index_copy_launcher_add_dst_field(this, idx, fid, inst)
    implicit none
    
    class(FIndexCopyLauncher), intent(in) :: this
    integer, intent(in)                   :: idx
    integer, intent(in)                   :: fid
    logical, optional, intent(in)         :: inst
    
    logical(c_bool) :: tmp_inst = .true.
    
    if (present(inst)) tmp_inst = inst
    call legion_index_copy_launcher_add_dst_field_c(this%index_copy_launcher, idx, fid, tmp_inst)
  end subroutine legion_index_copy_launcher_add_dst_field
  
  ! ===============================================================================
  ! AttachLauncher
  ! ===============================================================================
  function legion_attach_launcher_constructor(resource, logical_region, &
      parent_region)
    implicit none
    
    type(FAttachLauncher)            :: legion_attach_launcher_constructor
    integer(c_int), intent(in)       :: resource
    type(FLogicalRegion), intent(in) :: logical_region
    type(FLogicalRegion), intent(in) :: parent_region
    
    legion_attach_launcher_constructor%attach_launcher = &
      legion_attach_launcher_create_c(logical_region%lr, parent_region%lr, resource)
  end function legion_attach_launcher_constructor
  
  subroutine legion_attach_launcher_destructor(this)
    implicit none
    
    class(FAttachLauncher), intent(in) :: this
    
    call legion_attach_launcher_destroy_c(this%attach_launcher)
  end subroutine legion_attach_launcher_destructor
  
  subroutine legion_attach_launcher_attach_array_soa(this, fid, &
      base_ptr, column_major)
    implicit none
    class(FAttachLauncher), intent(in) :: this
    integer(c_int), intent(in)         :: fid
    type(c_ptr), intent(in)            :: base_ptr
    logical, intent(in)                :: column_major
    
    logical(c_bool) :: tmp_column_major
    tmp_column_major = column_major
    
    call legion_attach_launcher_add_cpu_soa_field_c(this%attach_launcher, fid, &
      base_ptr, tmp_column_major)
  end subroutine legion_attach_launcher_attach_array_soa
  
  ! ===============================================================================
  ! Task
  ! ===============================================================================
  function legion_task_get_region_requirement_by_id(this, id)
    implicit none
    
    type(FRegionRequirement)  :: legion_task_get_region_requirement_by_id
    class(FTask), intent(in)  :: this
    type(integer), intent(in) :: id
      
    legion_task_get_region_requirement_by_id%rr = legion_task_get_requirement_c(this%task, id)
    
  end function legion_task_get_region_requirement_by_id
  
  function legion_task_get_arglen(this)
    implicit none
    
    integer(kind=8)          :: legion_task_get_arglen
    class(FTask), intent(in) :: this
    
    legion_task_get_arglen = legion_task_get_arglen_c(this%task)
  end function legion_task_get_arglen
  
  function legion_task_get_args(this)
    implicit none
    
    type(c_ptr)              :: legion_task_get_args
    class(FTask), intent(in) :: this
    
    legion_task_get_args = legion_task_get_args_c(this%task)
  end function legion_task_get_args
  
  function legion_task_get_local_arglen(this)
    implicit none
    
    integer(kind=8)          :: legion_task_get_local_arglen
    class(FTask), intent(in) :: this
    
    legion_task_get_local_arglen = legion_task_get_local_arglen_c(this%task)
  end function legion_task_get_local_arglen
  
  function legion_task_get_local_args(this)
    implicit none
    
    type(c_ptr)              :: legion_task_get_local_args
    class(FTask), intent(in) :: this
    
    legion_task_get_local_args = legion_task_get_local_args_c(this%task)
  end function legion_task_get_local_args
  
  function legion_task_get_future(this, idx)
    implicit none
    
    type(FFuture)            :: legion_task_get_future
    class(FTask), intent(in) :: this
    integer, intent(in)      :: idx
    
    legion_task_get_future%future = legion_task_get_future_c(this%task, idx)
  end function legion_task_get_future
  
  function legion_task_get_futures_size(this)
    implicit none
    
    integer                  :: legion_task_get_futures_size
    class(FTask), intent(in) :: this
    
    legion_task_get_futures_size = legion_task_get_futures_size_c(this%task)
  end function legion_task_get_futures_size
  
  ! ===============================================================================
  ! Runtime
  ! ===============================================================================
  function legion_runtime_get_index_domain_return_domain(this, ctx, index_space)
    implicit none
    
    type(FDomain)                :: legion_runtime_get_index_domain_return_domain
    class(FRuntime), intent(in)   :: this
    type(FContext), intent(in)    :: ctx
    type(FIndexSpace), intent(in) :: index_space
    
    type(FContext) :: dummy_ctx
    dummy_ctx = ctx
    
    legion_runtime_get_index_domain_return_domain%domain = legion_index_space_get_domain_c(this%runtime, index_space%is)
  end function legion_runtime_get_index_domain_return_domain
  
  function legion_runtime_create_index_space_from_elmts_size(this, ctx, max_num_elmts)
    implicit none
    
    type(FIndexSpace)           :: legion_runtime_create_index_space_from_elmts_size
    class(FRuntime), intent(in) :: this
    type(FContext), intent(in)  :: ctx
    integer(kind=8), intent(in) :: max_num_elmts
      
    legion_runtime_create_index_space_from_elmts_size%is = legion_index_space_create_c(this%runtime, &
                                                             ctx%context, max_num_elmts)
  end function legion_runtime_create_index_space_from_elmts_size
  
  function legion_runtime_create_index_space_from_domain(this, ctx, domain)
    implicit none
    
    type(FIndexSpace)           :: legion_runtime_create_index_space_from_domain
    class(FRuntime), intent(in) :: this
    type(FContext), intent(in)  :: ctx
    type(FDomain), intent(in)   :: domain
      
    legion_runtime_create_index_space_from_domain%is = legion_index_space_create_domain_c(this%runtime, &
                                                         ctx%context, domain%domain)
  end function legion_runtime_create_index_space_from_domain
  
  function legion_runtime_create_index_space_from_rect_1d(this, ctx, rect_1d)
    implicit none
    
    type(FIndexSpace)           :: legion_runtime_create_index_space_from_rect_1d
    class(FRuntime), intent(in) :: this
    type(FContext), intent(in)  :: ctx
    type(FRect1D), intent(in)   :: rect_1d
    
    type(legion_domain_f_t) :: domain
    
    domain = legion_domain_from_rect_1d_c(rect_1d%rect)  
    legion_runtime_create_index_space_from_rect_1d%is = legion_index_space_create_domain_c(this%runtime, &
                                                          ctx%context, domain)
  end function legion_runtime_create_index_space_from_rect_1d
  
  function legion_runtime_create_index_space_from_rect_2d(this, ctx, rect_2d)
    implicit none
    
    type(FIndexSpace)           :: legion_runtime_create_index_space_from_rect_2d
    class(FRuntime), intent(in) :: this
    type(FContext), intent(in)  :: ctx
    type(FRect2D), intent(in)   :: rect_2d
    
    type(legion_domain_f_t) :: domain
    
    domain = legion_domain_from_rect_2d_c(rect_2d%rect)  
    legion_runtime_create_index_space_from_rect_2d%is = legion_index_space_create_domain_c(this%runtime, &
                                                          ctx%context, domain)
  end function legion_runtime_create_index_space_from_rect_2d
  
  function legion_runtime_create_index_space_from_rect_3d(this, ctx, rect_3d)
    implicit none
    
    type(FIndexSpace)           :: legion_runtime_create_index_space_from_rect_3d
    class(FRuntime), intent(in) :: this
    type(FContext), intent(in)  :: ctx
    type(FRect3D), intent(in)   :: rect_3d
    
    type(legion_domain_f_t) :: domain
    
    domain = legion_domain_from_rect_3d_c(rect_3d%rect)  
    legion_runtime_create_index_space_from_rect_3d%is = legion_index_space_create_domain_c(this%runtime, &
                                                          ctx%context, domain)
  end function legion_runtime_create_index_space_from_rect_3d
  
  subroutine legion_runtime_destroy_index_space(this, ctx, index_space)
    implicit none
    
    class(FRuntime), intent(in)   :: this
    type(FContext), intent(in)    :: ctx
    type(FIndexSpace), intent(in) :: index_space
    
    call legion_index_space_destroy_c(this%runtime, ctx%context, index_space%is)
  end subroutine legion_runtime_destroy_index_space
  
  function legion_runtime_create_field_space(this, ctx)   
    implicit none
    
    type(FFieldSpace)           :: legion_runtime_create_field_space
    class(FRuntime), intent(in) :: this
    type(FContext), intent(in)  :: ctx
      
    legion_runtime_create_field_space%fs = legion_field_space_create_c(this%runtime, ctx%context)
  end function legion_runtime_create_field_space
  
  subroutine legion_runtime_destroy_field_space(this, ctx, field_space)
    implicit none
    
    class(FRuntime), intent(in)   :: this
    type(FContext), intent(in)    :: ctx
    type(FFieldSpace), intent(in) :: field_space
      
    call legion_field_space_destroy_c(this%runtime, ctx%context, field_space%fs)
  end subroutine legion_runtime_destroy_field_space
  
  function legion_runtime_create_field_allocator(this, ctx, field_space)
    implicit none
    
    type(FFieldAllocator)         :: legion_runtime_create_field_allocator
    class(FRuntime), intent(in)   :: this
    type(FContext), intent(in)    :: ctx
    type(FFieldSpace), intent(in) :: field_space
      
    legion_runtime_create_field_allocator%fa = legion_field_allocator_create_c(this%runtime, ctx%context, field_space%fs)
  end function legion_runtime_create_field_allocator
  
  function legion_runtime_create_logical_region(this, ctx, index_space, field_space)
    implicit none
    
    type(FLogicalRegion)          :: legion_runtime_create_logical_region
    class(FRuntime), intent(in)   :: this
    type(FContext), intent(in)    :: ctx
    type(FIndexSpace), intent(in) :: index_space
    type(FFieldSpace), intent(in) :: field_space
      
    legion_runtime_create_logical_region%lr = legion_logical_region_create_c(this%runtime, ctx%context, &
                                                index_space%is, field_space%fs)
  end function legion_runtime_create_logical_region
  
  subroutine legion_runtime_destroy_logical_region(this, ctx, logical_region)
    implicit none
    
    class(FRuntime), intent(in)      :: this
    type(FContext), intent(in)       :: ctx
    type(FLogicalRegion), intent(in) :: logical_region
      
    call legion_logical_region_destroy_c(this%runtime, ctx%context, logical_region%lr)
  end subroutine legion_runtime_destroy_logical_region
  
  function legion_runtime_create_equal_partition(this, ctx, parent, color_space, granularity, color)
    implicit none
    
    type(FIndexPartition)                 :: legion_runtime_create_equal_partition
    class(FRuntime), intent(in)           :: this
    type(FContext), intent(in)            :: ctx
    type(FIndexSpace), intent(in)         :: parent
    type(FIndexSpace), intent(in)         :: color_space
    integer(kind=8), optional, intent(in) :: granularity
    integer(c_int), optional, intent(in)  :: color
    
    integer(kind=8) :: tmp_granularity = 1
    integer(c_int) :: tmp_color = AUTO_GENERATE_ID
    
    if (present(granularity)) tmp_granularity = granularity
    if (present(color)) tmp_color = color
    
    legion_runtime_create_equal_partition%ip = legion_index_partition_create_equal_c(this%runtime, ctx%context, parent%is, &
                                                 color_space%is, tmp_granularity, tmp_color)
  end function legion_runtime_create_equal_partition
  
  function legion_runtime_create_partition_by_union(this, ctx, parent, &
      handle1, handle2, color_space, part_kind, color)
    implicit none
    type(FIndexPartition)                :: legion_runtime_create_partition_by_union
    class(FRuntime), intent(in)          :: this
    type(FContext), intent(in)           :: ctx
    type(FIndexSpace), intent(in)        :: parent
    type(FIndexPartition), intent(in)    :: handle1
    type(FIndexPartition), intent(in)    :: handle2 
    type(FIndexSpace), intent(in)        :: color_space
    integer, optional, intent(in)        :: part_kind
    integer(c_int), optional, intent(in) :: color
    
    integer :: tmp_part_kind = COMPUTE_KIND
    integer(c_int) :: tmp_color = AUTO_GENERATE_ID
    
    if (present(part_kind)) tmp_part_kind = part_kind
    if (present(color)) tmp_color = color
    
    legion_runtime_create_partition_by_union%ip = &
      legion_index_partition_create_by_union_c(this%runtime, ctx%context, &
      parent%is, handle1%ip, handle2%ip, color_space%is, tmp_part_kind, tmp_color)
  end function legion_runtime_create_partition_by_union
  
  function legion_runtime_create_partition_by_intersection(this, ctx, parent, &
      handle1, handle2, color_space, part_kind, color)
    implicit none
    type(FIndexPartition)                :: legion_runtime_create_partition_by_intersection
    class(FRuntime), intent(in)          :: this
    type(FContext), intent(in)           :: ctx
    type(FIndexSpace), intent(in)        :: parent
    type(FIndexPartition), intent(in)    :: handle1
    type(FIndexPartition), intent(in)    :: handle2 
    type(FIndexSpace), intent(in)        :: color_space
    integer, optional, intent(in)        :: part_kind
    integer(c_int), optional, intent(in) :: color
    
    integer :: tmp_part_kind = COMPUTE_KIND
    integer(c_int) :: tmp_color = AUTO_GENERATE_ID
    
    if (present(part_kind)) tmp_part_kind = part_kind
    if (present(color)) tmp_color = color
    
    legion_runtime_create_partition_by_intersection%ip = &
      legion_index_partition_create_by_intersection_c(this%runtime, ctx%context, &
      parent%is, handle1%ip, handle2%ip, color_space%is, tmp_part_kind, tmp_color)
  end function legion_runtime_create_partition_by_intersection
  
  function legion_runtime_create_partition_by_intersection_mirror(this, ctx, parent, &
      partition, part_kind, color, dominates)
    implicit none
    type(FIndexPartition)                :: legion_runtime_create_partition_by_intersection_mirror
    class(FRuntime), intent(in)          :: this
    type(FContext), intent(in)           :: ctx
    type(FIndexSpace), intent(in)        :: parent
    type(FIndexPartition), intent(in)    :: partition
    integer, optional, intent(in)        :: part_kind
    integer(c_int), optional, intent(in) :: color
    logical, optional, intent(in)        :: dominates
    
    integer :: tmp_part_kind = COMPUTE_KIND
    integer(c_int) :: tmp_color = AUTO_GENERATE_ID
    logical(c_bool) :: tmp_dominates = .false.
    
    if (present(part_kind)) tmp_part_kind = part_kind
    if (present(color)) tmp_color = color
    if (present(dominates)) tmp_dominates = dominates
    
    legion_runtime_create_partition_by_intersection_mirror%ip = &
      legion_index_partition_create_by_intersection_mirror_c(this%runtime, ctx%context, &
      parent%is, partition%ip, tmp_part_kind, tmp_color, tmp_dominates)
  end function legion_runtime_create_partition_by_intersection_mirror
  
  function legion_runtime_create_partition_by_difference(this, ctx, parent, &
      handle1, handle2, color_space, part_kind, color)
    implicit none
    type(FIndexPartition)                :: legion_runtime_create_partition_by_difference
    class(FRuntime), intent(in)          :: this
    type(FContext), intent(in)           :: ctx
    type(FIndexSpace), intent(in)        :: parent
    type(FIndexPartition), intent(in)    :: handle1
    type(FIndexPartition), intent(in)    :: handle2 
    type(FIndexSpace), intent(in)        :: color_space
    integer, optional, intent(in)        :: part_kind
    integer(c_int), optional, intent(in) :: color
    
    integer :: tmp_part_kind = COMPUTE_KIND
    integer(c_int) :: tmp_color = AUTO_GENERATE_ID
    
    if (present(part_kind)) tmp_part_kind = part_kind
    if (present(color)) tmp_color = color
    
    legion_runtime_create_partition_by_difference%ip = &
      legion_index_partition_create_by_difference_c(this%runtime, ctx%context, &
      parent%is, handle1%ip, handle2%ip, color_space%is, tmp_part_kind, tmp_color)
  end function legion_runtime_create_partition_by_difference
  
  function legion_runtime_create_partition_by_image(this, ctx, handle, &
      projection, parent, fid, color_space, part_kind, color)
    implicit none
    type(FIndexPartition)                :: legion_runtime_create_partition_by_image
    class(FRuntime), intent(in)          :: this
    type(FContext), intent(in)           :: ctx
    type(FIndexSpace), intent(in)        :: handle
    type(FLogicalPartition), intent(in)  :: projection
    type(FLogicalRegion), intent(in)     :: parent 
    integer, intent(in)                  :: fid
    type(FIndexSpace), intent(in)        :: color_space
    integer, optional, intent(in)        :: part_kind
    integer(c_int), optional, intent(in) :: color
    
    integer :: tmp_part_kind = COMPUTE_KIND
    integer(c_int) :: tmp_color = AUTO_GENERATE_ID
    
    if (present(part_kind)) tmp_part_kind = part_kind
    if (present(color)) tmp_color = color
    
    legion_runtime_create_partition_by_image%ip = &
      legion_index_partition_create_by_image_c(this%runtime, ctx%context, &
      handle%is, projection%lp, parent%lr, fid, color_space%is, tmp_part_kind, tmp_color)
  end function legion_runtime_create_partition_by_image
  
  function legion_runtime_create_partition_by_image_range(this, ctx, handle, &
      projection, parent, fid, color_space, part_kind, color)
    implicit none
    type(FIndexPartition)                :: legion_runtime_create_partition_by_image_range
    class(FRuntime), intent(in)          :: this
    type(FContext), intent(in)           :: ctx
    type(FIndexSpace), intent(in)        :: handle
    type(FLogicalPartition), intent(in)  :: projection
    type(FLogicalRegion), intent(in)     :: parent 
    integer, intent(in)                  :: fid
    type(FIndexSpace), intent(in)        :: color_space
    integer, optional, intent(in)        :: part_kind
    integer(c_int), optional, intent(in) :: color
    
    integer :: tmp_part_kind = COMPUTE_KIND
    integer(c_int) :: tmp_color = AUTO_GENERATE_ID
    
    if (present(part_kind)) tmp_part_kind = part_kind
    if (present(color)) tmp_color = color
    
    legion_runtime_create_partition_by_image_range%ip = &
      legion_index_partition_create_by_image_range_c(this%runtime, ctx%context, &
      handle%is, projection%lp, parent%lr, fid, color_space%is, tmp_part_kind, tmp_color)
  end function legion_runtime_create_partition_by_image_range
  
  function legion_runtime_create_partition_by_preimage(this, ctx, projection, &
      handle, parent, fid, color_space, part_kind, color)
    implicit none
    type(FIndexPartition)                :: legion_runtime_create_partition_by_preimage
    class(FRuntime), intent(in)          :: this
    type(FContext), intent(in)           :: ctx
    type(FIndexPartition), intent(in)    :: projection
    type(FLogicalRegion), intent(in)     :: handle
    type(FLogicalRegion), intent(in)     :: parent 
    integer, intent(in)                  :: fid
    type(FIndexSpace), intent(in)        :: color_space
    integer, optional, intent(in)        :: part_kind
    integer(c_int), optional, intent(in) :: color
    
    integer :: tmp_part_kind = COMPUTE_KIND
    integer(c_int) :: tmp_color = AUTO_GENERATE_ID
    
    if (present(part_kind)) tmp_part_kind = part_kind
    if (present(color)) tmp_color = color
    
    legion_runtime_create_partition_by_preimage%ip = &
      legion_index_partition_create_by_preimage_c(this%runtime, ctx%context, &
      projection%ip, handle%lr, parent%lr, fid, color_space%is, tmp_part_kind, tmp_color)
  end function legion_runtime_create_partition_by_preimage
  
  function legion_runtime_create_partition_by_preimage_range(this, ctx, projection, &
      handle, parent, fid, color_space, part_kind, color)
    implicit none
    type(FIndexPartition)                :: legion_runtime_create_partition_by_preimage_range
    class(FRuntime), intent(in)          :: this
    type(FContext), intent(in)           :: ctx
    type(FIndexPartition), intent(in)    :: projection
    type(FLogicalRegion), intent(in)     :: handle
    type(FLogicalRegion), intent(in)     :: parent 
    integer, intent(in)                  :: fid
    type(FIndexSpace), intent(in)        :: color_space
    integer, optional, intent(in)        :: part_kind
    integer(c_int), optional, intent(in) :: color
    
    integer :: tmp_part_kind = COMPUTE_KIND
    integer(c_int) :: tmp_color = AUTO_GENERATE_ID
    
    if (present(part_kind)) tmp_part_kind = part_kind
    if (present(color)) tmp_color = color
    
    legion_runtime_create_partition_by_preimage_range%ip = &
      legion_index_partition_create_by_preimage_range_c(this%runtime, ctx%context, &
      projection%ip, handle%lr, parent%lr, fid, color_space%is, tmp_part_kind, tmp_color)
  end function legion_runtime_create_partition_by_preimage_range
  
  function legion_runtime_create_partition_by_restriction_domain_transform(this, ctx, parent, &
      color_space, transform, extent, part_kind, color)
    implicit none
    
    type(FIndexPartition) :: legion_runtime_create_partition_by_restriction_domain_transform
    class(FRuntime), intent(in)           :: this
    type(FContext), intent(in)            :: ctx
    type(FIndexSpace), intent(in)         :: parent
    type(FIndexSpace), intent(in)         :: color_space
    type(FDomainTransform), intent(in)    :: transform
    type(FDomain), intent(in)             :: extent
    integer, optional, intent(in)         :: part_kind
    integer(c_int), optional, intent(in)  :: color
    
    integer :: tmp_part_kind = COMPUTE_KIND
    integer(c_int) :: tmp_color = AUTO_GENERATE_ID
    
    if (present(part_kind)) tmp_part_kind = part_kind
    if (present(color)) tmp_color = color
    
    legion_runtime_create_partition_by_restriction_domain_transform%ip = &
      legion_index_partition_create_by_restriction_c(this%runtime, ctx%context, parent%is, &
      color_space%is, transform%transform, extent%domain, tmp_part_kind, tmp_color)
  end function legion_runtime_create_partition_by_restriction_domain_transform
  
  function legion_runtime_create_partition_by_restriction_transform_1x1(this, ctx, parent, &
      color_space, transform, extent, part_kind, color)
    implicit none
    
    type(FIndexPartition) :: legion_runtime_create_partition_by_restriction_transform_1x1
    class(FRuntime), intent(in)           :: this
    type(FContext), intent(in)            :: ctx
    type(FIndexSpace), intent(in)         :: parent
    type(FIndexSpace), intent(in)         :: color_space
    type(FTransform1X1), intent(in)       :: transform
    type(FRect1D), intent(in)             :: extent
    integer, optional, intent(in)         :: part_kind
    integer(c_int), optional, intent(in)  :: color
    
    integer :: tmp_part_kind = COMPUTE_KIND
    integer(c_int) :: tmp_color = AUTO_GENERATE_ID
    type(legion_domain_transform_f_t) :: domain_transform
    type(legion_domain_f_t) :: domain
    
    if (present(part_kind)) tmp_part_kind = part_kind
    if (present(color)) tmp_color = color
    
    domain = legion_domain_from_rect_1d_c(extent%rect)
    domain_transform = legion_domain_transform_from_1x1_c(transform%transform)
    
    legion_runtime_create_partition_by_restriction_transform_1x1%ip = &
      legion_index_partition_create_by_restriction_c(this%runtime, ctx%context, parent%is, &
      color_space%is, domain_transform, domain, tmp_part_kind, tmp_color)
  end function legion_runtime_create_partition_by_restriction_transform_1x1
  
  function legion_runtime_create_partition_by_restriction_transform_2x2(this, ctx, parent, &
      color_space, transform, extent, part_kind, color)
    implicit none
    
    type(FIndexPartition) :: legion_runtime_create_partition_by_restriction_transform_2x2
    class(FRuntime), intent(in)           :: this
    type(FContext), intent(in)            :: ctx
    type(FIndexSpace), intent(in)         :: parent
    type(FIndexSpace), intent(in)         :: color_space
    type(FTransform2X2), intent(in)       :: transform
    type(FRect2D), intent(in)             :: extent
    integer, optional, intent(in)         :: part_kind
    integer(c_int), optional, intent(in)  :: color
    
    integer :: tmp_part_kind = COMPUTE_KIND
    integer(c_int) :: tmp_color = AUTO_GENERATE_ID
    type(legion_domain_transform_f_t) :: domain_transform
    type(legion_domain_f_t) :: domain
    
    if (present(part_kind)) tmp_part_kind = part_kind
    if (present(color)) tmp_color = color
    
    domain = legion_domain_from_rect_2d_c(extent%rect)
    domain_transform = legion_domain_transform_from_2x2_c(transform%transform)
    
    legion_runtime_create_partition_by_restriction_transform_2x2%ip = &
      legion_index_partition_create_by_restriction_c(this%runtime, ctx%context, parent%is, &
      color_space%is, domain_transform, domain, tmp_part_kind, tmp_color)
  end function legion_runtime_create_partition_by_restriction_transform_2x2
  
  function legion_runtime_create_partition_by_restriction_transform_3x3(this, ctx, parent, &
      color_space, transform, extent, part_kind, color)
    implicit none
    
    type(FIndexPartition) :: legion_runtime_create_partition_by_restriction_transform_3x3
    class(FRuntime), intent(in)           :: this
    type(FContext), intent(in)            :: ctx
    type(FIndexSpace), intent(in)         :: parent
    type(FIndexSpace), intent(in)         :: color_space
    type(FTransform3X3), intent(in)       :: transform
    type(FRect3D), intent(in)             :: extent
    integer, optional, intent(in)         :: part_kind
    integer(c_int), optional, intent(in)  :: color
    
    integer :: tmp_part_kind = COMPUTE_KIND
    integer(c_int) :: tmp_color = AUTO_GENERATE_ID
    type(legion_domain_transform_f_t) :: domain_transform
    type(legion_domain_f_t) :: domain
    
    if (present(part_kind)) tmp_part_kind = part_kind
    if (present(color)) tmp_color = color
    
    domain = legion_domain_from_rect_3d_c(extent%rect)
    domain_transform = legion_domain_transform_from_3x3_c(transform%transform)
    
    legion_runtime_create_partition_by_restriction_transform_3x3%ip = &
      legion_index_partition_create_by_restriction_c(this%runtime, ctx%context, parent%is, &
      color_space%is, domain_transform, domain, tmp_part_kind, tmp_color)
  end function legion_runtime_create_partition_by_restriction_transform_3x3
  
  function legion_runtime_get_logical_partition(this, ctx, parent, handle)
    implicit none
    
    type(FLogicalPartition)           :: legion_runtime_get_logical_partition
    class(FRuntime), intent(in)       :: this
    type(FContext), intent(in)        :: ctx
    type(FLogicalRegion), intent(in)  :: parent
    type(FIndexPartition), intent(in) :: handle
      
    legion_runtime_get_logical_partition%lp = legion_logical_partition_create_c(this%runtime, ctx%context, &
                                                parent%lr, handle%ip)
  end function legion_runtime_get_logical_partition
  
  function legion_runtime_execute_task(this, ctx, launcher)
    implicit none
    
    type(FFuture)                   :: legion_runtime_execute_task
    class(FRuntime), intent(in)     :: this
    type(FContext), intent(in)      :: ctx
    type(FTaskLauncher), intent(in) :: launcher
      
    legion_runtime_execute_task%future = legion_task_launcher_execute_c(this%runtime, ctx%context, launcher%launcher)
  end function legion_runtime_execute_task
  
  function legion_runtime_execute_index_space(this, ctx, launcher)
    implicit none
    
    type(FFutureMap)                 :: legion_runtime_execute_index_space
    class(FRuntime), intent(in)      :: this
    type(FContext), intent(in)       :: ctx
    type(FIndexLauncher), intent(in) :: launcher
    
    legion_runtime_execute_index_space%future_map = legion_index_launcher_execute_c(this%runtime, ctx%context, &
                                                      launcher%index_launcher)
  end function legion_runtime_execute_index_space
  
  function legion_runtime_map_region(this, ctx, launcher)
    implicit none
    
    type(FPhysicalRegion)             :: legion_runtime_map_region
    class(FRuntime), intent(in)       :: this
    type(FContext), intent(in)        :: ctx
    type(FInlineLauncher), intent(in) :: launcher
      
    legion_runtime_map_region%pr = legion_inline_launcher_execute_c( &
      this%runtime, ctx%context, launcher%inline_launcher)
  end function legion_runtime_map_region
  
  subroutine legion_runtime_unmap_region(this, ctx, region)
    implicit none
    
    class(FRuntime), intent(in)       :: this
    type(FContext), intent(in)        :: ctx
    type(FPhysicalRegion), intent(in) :: region
      
    call legion_runtime_unmap_region_c( &
      this%runtime, ctx%context, region%pr)
  end subroutine legion_runtime_unmap_region
  
  subroutine legion_runtime_remap_region(this, ctx, region)
    implicit none
    
    class(FRuntime), intent(in)       :: this
    type(FContext), intent(in)        :: ctx
    type(FPhysicalRegion), intent(in) :: region
      
    call legion_runtime_remap_region_c( &
      this%runtime, ctx%context, region%pr)
  end subroutine legion_runtime_remap_region
  
  subroutine legion_runtime_fill_field_integer4(this, ctx, handle, parent, fid, value, pred)
    implicit none
    
    class(FRuntime), intent(in)            :: this
    type(FContext), intent(in)             :: ctx
    type(FLogicalRegion), intent(in)       :: handle
    type(FLogicalRegion), intent(in)       :: parent
    integer, intent(in)                    :: fid
    integer(kind=4), target, intent(in)    :: value
    type(FPredicate), optional, intent(in) :: pred
      
    type(legion_predicate_f_t) :: tmp_pred
    
    tmp_pred = legion_predicate_true_c()
    if (present(pred)) tmp_pred = pred%predicate
    
    call legion_runtime_fill_field_c(this%runtime, ctx%context, &
      handle%lr, parent%lr, fid, c_loc(value), c_sizeof(value), tmp_pred)
  end subroutine legion_runtime_fill_field_integer4
  
  subroutine legion_runtime_fill_field_integer8(this, ctx, handle, parent, fid, value, pred)
    implicit none
    
    class(FRuntime), intent(in)            :: this
    type(FContext), intent(in)             :: ctx
    type(FLogicalRegion), intent(in)       :: handle
    type(FLogicalRegion), intent(in)       :: parent
    integer, intent(in)                    :: fid
    integer(kind=8), target, intent(in)    :: value
    type(FPredicate), optional, intent(in) :: pred
      
    type(legion_predicate_f_t) :: tmp_pred
    
    tmp_pred = legion_predicate_true_c()
    if (present(pred)) tmp_pred = pred%predicate
    
    call legion_runtime_fill_field_c(this%runtime, ctx%context, &
      handle%lr, parent%lr, fid, c_loc(value), c_sizeof(value), tmp_pred)
  end subroutine legion_runtime_fill_field_integer8
  
  subroutine legion_runtime_fill_field_real4(this, ctx, handle, parent, fid, value, pred)
    implicit none
    
    class(FRuntime), intent(in)            :: this
    type(FContext), intent(in)             :: ctx
    type(FLogicalRegion), intent(in)       :: handle
    type(FLogicalRegion), intent(in)       :: parent
    integer, intent(in)                    :: fid
    real(kind=4), target, intent(in)       :: value
    type(FPredicate), optional, intent(in) :: pred
      
    type(legion_predicate_f_t) :: tmp_pred
    
    tmp_pred = legion_predicate_true_c()
    if (present(pred)) tmp_pred = pred%predicate
    
    call legion_runtime_fill_field_c(this%runtime, ctx%context, &
      handle%lr, parent%lr, fid, c_loc(value), c_sizeof(value), tmp_pred)
  end subroutine legion_runtime_fill_field_real4
  
  subroutine legion_runtime_fill_field_real8(this, ctx, handle, parent, fid, value, pred)
    implicit none
    
    class(FRuntime), intent(in)            :: this
    type(FContext), intent(in)             :: ctx
    type(FLogicalRegion), intent(in)       :: handle
    type(FLogicalRegion), intent(in)       :: parent
    integer, intent(in)                    :: fid
    real(kind=8), target, intent(in)       :: value
    type(FPredicate), optional, intent(in) :: pred
      
    type(legion_predicate_f_t) :: tmp_pred
    
    tmp_pred = legion_predicate_true_c()
    if (present(pred)) tmp_pred = pred%predicate
    
    call legion_runtime_fill_field_c(this%runtime, ctx%context, &
      handle%lr, parent%lr, fid, c_loc(value), c_sizeof(value), tmp_pred)
  end subroutine legion_runtime_fill_field_real8
  
  subroutine legion_runtime_fill_field_ptr(this, ctx, handle, parent, fid, value, value_size, pred)
    implicit none
    
    class(FRuntime), intent(in)            :: this
    type(FContext), intent(in)             :: ctx
    type(FLogicalRegion), intent(in)       :: handle
    type(FLogicalRegion), intent(in)       :: parent
    integer, intent(in)                    :: fid
    type(c_ptr), intent(in)                :: value
    integer(c_size_t), intent(in)          :: value_size
    type(FPredicate), optional, intent(in) :: pred
      
    type(legion_predicate_f_t) :: tmp_pred
    
    tmp_pred = legion_predicate_true_c()
    if (present(pred)) tmp_pred = pred%predicate
    
    call legion_runtime_fill_field_c(this%runtime, ctx%context, &
      handle%lr, parent%lr, fid, value, value_size, tmp_pred)
  end subroutine legion_runtime_fill_field_ptr
  
  subroutine legion_runtime_issue_copy_operation_single(this, ctx, launcher)
    implicit none
    
    class(FRuntime), intent(in)     :: this
    type(FContext), intent(in)      :: ctx
    type(FCopyLauncher), intent(in) :: launcher
      
    call legion_copy_launcher_execute_c(this%runtime, &
      ctx%context, launcher%copy_launcher)
  end subroutine legion_runtime_issue_copy_operation_single
  
  subroutine legion_runtime_issue_copy_operation_index(this, ctx, launcher)
    implicit none
    
    class(FRuntime), intent(in)          :: this
    type(FContext), intent(in)           :: ctx
    type(FIndexCopyLauncher), intent(in) :: launcher
      
    call legion_index_copy_launcher_execute_c(this%runtime, &
      ctx%context, launcher%index_copy_launcher)
  end subroutine legion_runtime_issue_copy_operation_index
  
  function legion_runtime_attach_external_resource(this, ctx, launcher)
    implicit none
    
    type(FPhysicalRegion)             :: legion_runtime_attach_external_resource
    class(FRuntime), intent(in)       :: this
    type(FContext), intent(in)        :: ctx
    type(FAttachLauncher), intent(in) :: launcher
      
    legion_runtime_attach_external_resource%pr = &
      legion_attach_launcher_execute_c(this%runtime, ctx%context, launcher%attach_launcher)
  end function legion_runtime_attach_external_resource
  
  function legion_runtime_detach_external_resource(this, ctx, handle)
    implicit none
    
    type(FFuture)                     :: legion_runtime_detach_external_resource
    class(FRuntime), intent(in)       :: this
    type(FContext), intent(in)        :: ctx
    type(FPhysicalRegion), intent(in) :: handle
      
    legion_runtime_detach_external_resource%future = &
      legion_detach_external_resource_c(this%runtime, ctx%context, handle%pr)
  end function legion_runtime_detach_external_resource
  
  function legion_runtime_detach_external_resource_flush(this, ctx, handle, flush)
    implicit none
    
    type(FFuture)                     :: legion_runtime_detach_external_resource_flush
    class(FRuntime), intent(in)       :: this
    type(FContext), intent(in)        :: ctx
    type(FPhysicalRegion), intent(in) :: handle
    logical, intent(in)               :: flush
    
    logical(c_bool) :: tmp_flush
    tmp_flush = flush
      
    legion_runtime_detach_external_resource_flush%future = &
      legion_flush_detach_external_resource_c(this%runtime, ctx%context, handle%pr, tmp_flush)
  end function legion_runtime_detach_external_resource_flush
  
  function legion_runtime_detach_external_resource_unordered(this, ctx, handle, &
      flush, unordered)
    implicit none
    
    type(FFuture)                     :: legion_runtime_detach_external_resource_unordered
    class(FRuntime), intent(in)       :: this
    type(FContext), intent(in)        :: ctx
    type(FPhysicalRegion), intent(in) :: handle
    logical, intent(in)               :: flush
    logical, intent(in)               :: unordered
    
    logical(c_bool) :: tmp_flush
    logical(c_bool) :: tmp_unordered
    tmp_flush = flush
    tmp_unordered = unordered
      
    legion_runtime_detach_external_resource_unordered%future = &
      legion_unordered_detach_external_resource_c(this%runtime, ctx%context, handle%pr, &
                                        tmp_flush, tmp_unordered)
  end function legion_runtime_detach_external_resource_unordered
  
  ! ===============================================================================
  ! ProcessorConstraint
  ! ===============================================================================
  function legion_processor_constraint_constructor(proc_kind)
    implicit none
    
    type(FProcessorConstraint) :: legion_processor_constraint_constructor
    integer(c_int), intent(in) :: proc_kind
      
    legion_processor_constraint_constructor%proc_kind = proc_kind
  end function legion_processor_constraint_constructor
  
  ! ===============================================================================
  ! TaskVariantRegistrar
  ! ===============================================================================
  function legion_task_variant_registrar_constructor(task_id)
    implicit none
    
    type(FTaskVariantRegistrar) :: legion_task_variant_registrar_constructor
    integer(c_int), intent(in)  :: task_id
    
    legion_task_variant_registrar_constructor%task_id = task_id  
    legion_task_variant_registrar_constructor%execution_constraints = legion_execution_constraint_set_create_c()
    legion_task_variant_registrar_constructor%task_layout_constraints = legion_task_layout_constraint_set_create_c()
    legion_task_variant_registrar_constructor%config_options%leaf = .false.
    legion_task_variant_registrar_constructor%config_options%inner = .false.
    legion_task_variant_registrar_constructor%config_options%idempotent = .false.
    legion_task_variant_registrar_constructor%config_options%replicable = .false.
  end function legion_task_variant_registrar_constructor
  
  subroutine legion_task_variant_registrar_destructor(this)
    implicit none
    
    class(FTaskVariantRegistrar), intent(in) :: this
      
    call legion_execution_constraint_set_destroy_c(this%execution_constraints)
    call legion_task_layout_constraint_set_destroy_c(this%task_layout_constraints)
  end subroutine legion_task_variant_registrar_destructor
  
  subroutine legion_task_variant_registrar_add_processor_constraint(this, proc_constraint)
    implicit none
    
    class(FTaskVariantRegistrar), intent(in) :: this
    type(FProcessorConstraint), intent(in)   :: proc_constraint
    
    call legion_execution_constraint_set_add_processor_constraint_c(this%execution_constraints, proc_constraint%proc_kind)
  end subroutine legion_task_variant_registrar_add_processor_constraint
  
  subroutine legion_task_variant_registrar_set_leaf(this, is_leaf)
    implicit none
    
    class(FTaskVariantRegistrar), intent(inout) :: this
    logical(c_bool), optional, intent(in)       :: is_leaf
    
    logical(c_bool) :: tmp_is_leaf = .true.
    
    if (present(is_leaf)) tmp_is_leaf = is_leaf
    
    this%config_options%leaf = tmp_is_leaf             
  end subroutine legion_task_variant_registrar_set_leaf
  
  subroutine legion_task_variant_registrar_set_inner(this, is_inner)
    implicit none
    
    class(FTaskVariantRegistrar), intent(inout) :: this
    logical(c_bool), optional, intent(in)       :: is_inner
    
    logical(c_bool) :: tmp_is_inner = .true.
    
    if (present(is_inner)) tmp_is_inner = is_inner
    
    this%config_options%inner = tmp_is_inner             
  end subroutine legion_task_variant_registrar_set_inner
  
  subroutine legion_task_variant_registrar_set_idempotent(this, is_idempotent)
    implicit none
    
    class(FTaskVariantRegistrar), intent(inout) :: this
    logical(c_bool), optional, intent(in)       :: is_idempotent
    
    logical(c_bool) :: tmp_is_idempotent = .true.
    
    if (present(is_idempotent)) tmp_is_idempotent = is_idempotent
    
    this%config_options%idempotent = tmp_is_idempotent             
  end subroutine legion_task_variant_registrar_set_idempotent
  
  subroutine legion_task_variant_registrar_set_replicable(this, is_replicable)
    implicit none
    
    class(FTaskVariantRegistrar), intent(inout) :: this
    logical(c_bool), optional, intent(in)    :: is_replicable
    
    logical(c_bool) :: tmp_is_replicable = .true.
    
    if (present(is_replicable)) tmp_is_replicable = is_replicable
    
    this%config_options%replicable = tmp_is_replicable             
  end subroutine legion_task_variant_registrar_set_replicable
  
  ! ===============================================================================
  ! Static functions
  ! ===============================================================================
  ! @see legion_task_preamble
  subroutine legion_task_prolog(tdata, tdatalen, &
                                userdata, userlen, &
                                proc_id, &
                                task, pr_list, &
                                ctx, runtime)
    
    implicit none
                                
    type(c_ptr), intent(in)                        :: tdata ! pass reference
    integer(c_size_t), value, intent(in)           :: tdatalen
    type(c_ptr), optional, intent(in)              :: userdata ! dummy
    integer(c_size_t), value, optional, intent(in) :: userlen ! dummy
    integer(c_long_long), value, intent(in)        :: proc_id
    type(FTask), intent(out)                       :: task ! pass reference
    type(FPhysicalRegionList), intent(out)         :: pr_list ! pass reference
    type(FContext), intent(out)                    :: ctx ! pass reference          
    type(FRuntime), intent(out)                    :: runtime ! pass reference
    
    type(c_ptr) :: tmp_userdata
    integer(c_size_t) :: tmp_userlen
    
    if (present(userdata)) tmp_userdata = c_null_ptr
    if (present(userlen)) tmp_userlen = userlen
      
    call legion_task_preamble_c(tdata, tdatalen, proc_id, &
                                task%task, pr_list%region_ptr, pr_list%num_regions, &
                                ctx%context, runtime%runtime)
  end subroutine legion_task_prolog
  
  ! @see legion_task_postamble
  subroutine legion_task_epilog(runtime, ctx, retval, retsize)
    implicit none

    type(FRuntime), intent(in)                     :: runtime
    type(FContext), intent(in)                     :: ctx
    type(c_ptr), optional, intent(in)              :: retval
    integer(c_size_t), value, optional, intent(in) :: retsize
    
    type(c_ptr) :: tmp_retval
    integer(c_size_t) :: tmp_retsize
    
    tmp_retval = c_null_ptr
    tmp_retsize = 0
    if (present(retval)) tmp_retval = retval
    if (present(retsize)) tmp_retsize = retsize
  
    call legion_task_postamble_c(runtime%runtime, ctx%context, tmp_retval, tmp_retsize)
  end subroutine legion_task_epilog
  
  ! @see Legion::Runtime::set_top_level_task_id()
  subroutine set_top_level_task_id(id)
    implicit none
    
    integer(c_int), intent(in) :: id
    
    call legion_runtime_set_top_level_task_id_c(id)
  end subroutine set_top_level_task_id
  
  subroutine preregister_task_variant(task_func_ptr, registrar, task_name, vid)
    implicit none
    
    external                                :: task_func_ptr
    type(FTaskVariantRegistrar), intent(in) :: registrar
    character(*), intent(in)                :: task_name
    integer(c_int), optional, intent(in)    :: vid
    
    integer(c_int) :: tmp_vid = AUTO_GENERATE_ID
    integer(c_int) :: task_id_return
    integer(c_size_t) :: userlen = 0
    type(c_funptr) :: c_func_ptr  
    
    if (present(vid)) tmp_vid = vid
    c_func_ptr = c_funloc(task_func_ptr)
    task_id_return = legion_runtime_preregister_task_variant_fnptr_c(registrar%task_id, &
                       tmp_vid, task_name//c_null_char, &
                       c_char_"cpu_variant"//c_null_char, &
                       registrar%execution_constraints, &
                       registrar%task_layout_constraints, &
                       registrar%config_options, &
                       c_func_ptr, &
                       c_null_ptr, userlen)
  end subroutine preregister_task_variant
  
  subroutine legion_runtime_start(background)
    logical(c_bool), optional, intent(in) :: background
    
    logical(c_bool) :: tmp_background = .false.
    integer(c_int) :: ret_val
    integer(c_int) :: argc = 0
    type(c_ptr) :: argv(0:15)
    integer :: i
    
    type string
      character(len=:, kind=c_char), allocatable :: item
    end type string
    ! Temporary arrays of character.  Need to have TARGET for C_LOC.
    type(string), target :: tmp_argv(0:15)
    character(len=32) :: arg
    
    if (present(background)) tmp_background = background
    
    argc = iargc()
    if (iargc() > 0) then
      argv(0) = c_null_ptr ! somehow the first argv is not detected, so add a dummpy one
      do i = 1, iargc()
        call getarg(i, arg)
        print *, "arg", arg
        tmp_argv(i)%item = trim(arg) // c_null_char
        argv(i) = c_loc(tmp_argv(i)%item)
      end do
      argc = argc + 1
    else
      argv(0) = c_null_ptr
    end if
    ret_val = legion_runtime_start_c(argc, argv, tmp_background)
  end subroutine legion_runtime_start
  

end module