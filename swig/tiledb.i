%module tiledb
%pragma(java) jniclassimports=%{
import io.tiledb.libtiledb.NativeLibLoader;
import java.nio.ByteBuffer;
%}

%pragma(java) jniclasscode=%{
  static {
    try {
//       NativeLibLoader.loadNativeTBB();
      NativeLibLoader.loadNativeTileDB();
      NativeLibLoader.loadNativeTileDBJNI();
    } catch (Exception e) {
      System.err.println("Native code library failed to load");
      e.printStackTrace();
      System.exit(1);
    }
  }

  public final static native int tiledb_query_set_subarray_nio(long jarg1, long jarg2, ByteBuffer jarg3);
  public final static native int tiledb_query_set_data_buffer_nio(long jarg1, long jarg2, String jarg3, ByteBuffer jarg4, long jarg5);
  public final static native int tiledb_query_set_offsets_buffer_nio(long jarg1, long jarg2, String jarg3, ByteBuffer jarg4, long jarg5);
  public final static native int tiledb_query_set_validity_buffer_nio(long jarg1, long jarg2, String jarg3, ByteBuffer jarg4, long jarg5);
  public final static native int tiledb_object_walk_java(long jarg1, SWIGTYPE_p_tiledb_ctx_t jarg1_, String jarg2, int jarg3, Object jarg4);
  public final static native int tiledb_object_ls_java(long jarg1, SWIGTYPE_p_tiledb_ctx_t jarg1_, String jarg2, Object jarg3);
  public final static native long java_path_callback();
  public final static native long java_callback();
%}

#define __attribute__(x)

// Any typedef struct for a handle derivative must be defined here
typedef struct tiledb_ctx_t tiledb_ctx_t;
typedef struct tiledb_filter_t tiledb_filter_t;
typedef struct tiledb_config_t tiledb_config_t;
typedef struct tiledb_dimension_t tiledb_dimension_t;
typedef struct tiledb_domain_t tiledb_domain_t;

%{
#include <string>
#include <vector>
#include <stdio.h>

#include "tiledb/tiledb.h"
#include "tiledb/tiledb_experimental.h"
#include "tiledb_java_extensions.h"
%}

%ignore tiledb_ctx_alloc_with_error;

// ignore some deprecated methods
%ignore tiledb_query_submit_async;
%ignore tiledb_array_schema_load_with_key;
%ignore tiledb_query_set_subarray;
%ignore tiledb_query_add_range;
%ignore tiledb_query_add_range_by_name;
%ignore tiledb_query_add_range_var;
%ignore tiledb_query_add_range_var_by_name;
%ignore tiledb_query_get_range_num;
%ignore tiledb_query_get_range_num_from_name;
%ignore tiledb_query_get_range;
%ignore tiledb_query_get_range_from_name;
%ignore tiledb_query_get_range_var_size;
%ignore tiledb_query_get_range_var_size_from_name;
%ignore tiledb_query_get_range_var;
%ignore tiledb_query_get_range_var_from_name;
%ignore tiledb_array_create_with_key;
%ignore tiledb_array_consolidate_with_key;
%ignore tiledb_array_delete_array;
%ignore tiledb_query_add_point_ranges;

// %include "stdint.i"
%include "carrays.i"
%array_class(int32_t, int32_tArray);
%array_class(capi_return_t, capi_return_t);
%array_class(int64_t, int64_tArray);
%array_class(char, charArray);
%array_class(float, floatArray);
%array_class(double, doubleArray);
%array_class(int8_t, int8_tArray);
%array_class(uint8_t, uint8_tArray);
%array_class(int16_t, int16_tArray);
%array_class(uint16_t, uint16_tArray);
%array_class(uint32_t, uint32_tArray);
%array_class(uint64_t, uint64_tArray);

%array_functions(char *, charpArray);
%array_functions(void *, voidpArray )

%include "cpointer.i"
%pointer_functions(int, intp);
%pointer_functions(size_t, sizep);
%pointer_functions(float, floatp);
%pointer_functions(void **, voidppp);
%pointer_functions(int *, intpp);
%pointer_functions(char *, charpp);
%pointer_functions(unsigned int, uintp);
%pointer_functions(unsigned long long, ullp);
%pointer_functions(unsigned long, ulp);

%include "typemaps.i"
%include "enums.swg"

%javaconst(1);

%pointer_functions(tiledb_object_t, tiledb_object_tp);
%pointer_functions(tiledb_query_type_t, tiledb_query_type_tp);
%pointer_functions(tiledb_query_status_t, tiledb_query_status_tp);
%pointer_functions(tiledb_filesystem_t, tiledb_filesystem_tp);
%pointer_functions(tiledb_datatype_t, tiledb_datatype_tp);
%pointer_functions(tiledb_data_order_t, tiledb_data_order_tp);
%pointer_functions(tiledb_array_type_t, tiledb_array_type_tp);
%pointer_functions(tiledb_layout_t, tiledb_layout_tp);
%pointer_functions(tiledb_filter_type_t, tiledb_filter_type_tp);
%pointer_functions(tiledb_filter_option_t, tiledb_filter_option_tp);
%pointer_functions(tiledb_walk_order_t, tiledb_walk_order_tp);
%pointer_functions(tiledb_vfs_mode_t, tiledb_vfs_mode_tp);
%pointer_functions(tiledb_encryption_type_t, tiledb_encryption_type_tp);
%pointer_functions(capi_status_t, capi_status_tp);

%pointer_functions(tiledb_array_t*, tiledb_array_tpp);
%pointer_functions(tiledb_subarray_t*, tiledb_subarray_tpp);
%pointer_functions(tiledb_config_t*, tiledb_config_tpp);
%pointer_functions(tiledb_config_iter_t*, tiledb_config_iter_tpp);
%pointer_functions(tiledb_ctx_t*, tiledb_ctx_tpp);
%pointer_functions(tiledb_error_t*, tiledb_error_tpp);
%pointer_functions(tiledb_attribute_t*, tiledb_attribute_tpp);
%pointer_functions(tiledb_array_schema_t*, tiledb_array_schema_tpp);
%pointer_functions(tiledb_dimension_t*, tiledb_dimension_tpp);
%pointer_functions(tiledb_domain_t*, tiledb_domain_tpp);
%pointer_functions(tiledb_query_t*, tiledb_query_tpp);
%pointer_functions(tiledb_filter_t*, tiledb_filter_tpp);
%pointer_functions(tiledb_filter_list_t*, tiledb_filter_list_tpp);
%pointer_functions(tiledb_vfs_t*, tiledb_vfs_tpp);
%pointer_functions(tiledb_vfs_fh_t*, tiledb_vfs_fh_tpp);
%pointer_functions(tiledb_fragment_info_t*, tiledb_fragment_info_tpp);
%pointer_functions(tiledb_query_condition_t*, tiledb_query_condition_tpp);
%pointer_functions(tiledb_group_t*, tiledb_group_tpp);
%pointer_functions(capi_return_t*, capi_return_tpp);
%pointer_functions(tiledb_consolidation_plan_t*, tiledb_consolidation_plan_tpp);
%pointer_functions(tiledb_dimension_label_t*, tiledb_dimension_label_tpp);
%pointer_functions(tiledb_string_handle_t*, tiledb_string_handle_tpp);

%native (sizeOfInt32) int sizeOfInt32();
%native (sizeOfInt64) int sizeOfInt64();
%native (sizeOfChar) int sizeOfChar();
%native (sizeOfFloat) int sizeOfFloat();
%native (sizeOfDouble) int sizeOfDouble();
%native (sizeOfInt8) int sizeOfInt8();
%native (sizeOfUint8) int sizeOfUint8();
%native (sizeOfInt16) int sizeOfInt16();
%native (sizeOfUint16) int sizeOfUint16();
%native (sizeOfUint32) int sizeOfUint32();
%native (sizeOfUint64) int sizeOfUint64();

%native (newInt32ArraySet)  jlong newInt32ArraySet(jintArray jarg1);
%native (newInt64ArraySet)  jlong newInt64ArraySet(jlongArray jarg1);
%native (newCharArraySet)   jlong newCharArraySet(jstring jarg1);
%native (newFloatArraySet)  jlong newFloatArraySet(jfloatArray jarg1);
%native (newDoubleArraySet) jlong newDoubleArraySet(jdoubleArray jarg1);
%native (newInt8ArraySet)   jlong newInt8ArraySet(jbyteArray jarg1);
%native (newUint8ArraySet)  jlong newUint8ArraySet(jshortArray jarg1);
%native (newInt16ArraySet)  jlong newInt16ArraySet(jshortArray jarg1);
%native (newUint16ArraySet) jlong newUint16ArraySet(jintArray jarg1);
%native (newUint32ArraySet) jlong newUint32ArraySet(jlongArray jarg1);
%native (newUint64ArraySet) jlong newUint64ArraySet(jlongArray jarg1);

%native (int32ArrayGet) jintArray int32ArrayGet(jlong array, jint pos, jint sz);
%native (int64ArrayGet) jlongArray int64ArrayGet(jlong array, jint pos, jint sz);
%native (charArrayGet)  jstring charArrayGet(jlong array, jint pos);
%native (floatArrayGet) jfloatArray floatArrayGet(jlong array, jint pos, jint sz);
%native (doubleArrayGet) jdoubleArray doubleArrayGet(jlong array, jint pos, jint sz);
%native (int8ArrayGet) jbyteArray int8ArrayGet(jlong array, jint pos, jint sz);
%native (uint8ArrayGet) jshortArray uint8ArrayGet(jlong array, jint pos, jint sz);
%native (int16ArrayGet) jshortArray int16ArrayGet(jlong array, jint pos, jint sz);
%native (uint16ArrayGet) jintArray uint16ArrayGet(jlong array, jint pos, jint sz);
%native (uint32ArrayGet) jlongArray uint32ArrayGet(jlong array, jint pos, jint sz);
%native (uint64ArrayGet) jlongArray uint64ArrayGet(jlong array, jint pos, jint sz);

// tiledb_experimental.h
%pointer_functions(tiledb_array_schema_evolution_t*, tiledb_array_schema_evolution_tpp);

%ignore __mbstate_t;
%ignore _opaque_pthread_attr_t;
%ignore _opaque_pthread_cond_t;
%ignore _opaque_pthread_condattr_t;
%ignore _opaque_pthread_mutex_t;
%ignore _opaque_pthread_mutexattr_t;
%ignore _opaque_pthread_once_t;
%ignore _opaque_pthread_rwlock_t;
%ignore _opaque_pthread_rwlockattr_t;
%ignore _opaque_pthread_t;
%ignore __darwin_pthread_handler_rec;
%ignore __sbuf;
%ignore renameat;
%ignore renamex_np;
%ignore renameatx_np;
%ignore ctermid;
%ignore fileno;
%ignore pclose;
%ignore __srget;
%ignore __svfscanf;
%ignore __swbuf;
%ignore __sputc;
%ignore flockfile;
%ignore ftrylockfile;
%ignore funlockfile;
%ignore getc_unlocked;
%ignore getchar_unlocked;
%ignore putc_unlocked;
%ignore putchar_unlocked;
%ignore getw;
%ignore putw;
%ignore fseeko;
%ignore ftello;
%ignore snprintf;
%ignore vfscanf;
%ignore vscanf;
%ignore vsnprintf;
%ignore vsscanf;
%ignore dprintf;
%ignore vdprintf;
%ignore getdelim;
%ignore getline;
%ignore fmemopen;
%ignore open_memstream;
%ignore sys_nerr_get;
%ignore sys_errlist_get;
%ignore asprintf;
%ignore ctermid_r;
%ignore fgetln;
%ignore fmtcheck;
%ignore fpurge;
%ignore setbuffer;
%ignore setlinebuf;
%ignore vasprintf;
%ignore funopen;

%include "tiledb_generated.h"
%include "tiledb_java_extensions.h"

%pragma(java) modulecode=%{

  public static int sizeOfType(Object array) {
    Class arrayClass = array.getClass();
    if (arrayClass.equals(int32_tArray.class)) {
      return sizeOfInt32();
    } else if (arrayClass.equals(int64_tArray.class)) {
      return sizeOfInt64();
    } else if (arrayClass.equals(charArray.class)) {
      return sizeOfChar();
    } else if (arrayClass.equals(floatArray.class)) {
      return sizeOfFloat();
    } else if (arrayClass.equals(doubleArray.class)) {
      return sizeOfDouble();
    } else if (arrayClass.equals(int8_tArray.class)) {
      return sizeOfInt8();
    } else if (arrayClass.equals(uint8_tArray.class)) {
      return sizeOfUint8();
    } else if (arrayClass.equals(int16_tArray.class)) {
      return sizeOfInt16();
    } else if (arrayClass.equals(uint16_tArray.class)) {
      return sizeOfUint16();
    } else if (arrayClass.equals(uint32_tArray.class)) {
      return sizeOfUint32();
    } else if (arrayClass.equals(uint64_tArray.class)) {
      return sizeOfUint64();
    }
    return -1;
  }
%}

