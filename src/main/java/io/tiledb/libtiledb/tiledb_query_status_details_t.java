/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 4.0.2
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */

package io.tiledb.libtiledb;

public class tiledb_query_status_details_t {
  private transient long swigCPtr;
  protected transient boolean swigCMemOwn;

  protected tiledb_query_status_details_t(long cPtr, boolean cMemoryOwn) {
    swigCMemOwn = cMemoryOwn;
    swigCPtr = cPtr;
  }

  protected static long getCPtr(tiledb_query_status_details_t obj) {
    return (obj == null) ? 0 : obj.swigCPtr;
  }

  @SuppressWarnings("deprecation")
  protected void finalize() {
    delete();
  }

  public synchronized void delete() {
    if (swigCPtr != 0) {
      if (swigCMemOwn) {
        swigCMemOwn = false;
        tiledbJNI.delete_tiledb_query_status_details_t(swigCPtr);
      }
      swigCPtr = 0;
    }
  }

  public void setIncomplete_reason(tiledb_query_status_details_reason_t value) {
    tiledbJNI.tiledb_query_status_details_t_incomplete_reason_set(
        swigCPtr, this, value.swigValue());
  }

  public tiledb_query_status_details_reason_t getIncomplete_reason() {
    return tiledb_query_status_details_reason_t.swigToEnum(
        tiledbJNI.tiledb_query_status_details_t_incomplete_reason_get(swigCPtr, this));
  }

  public tiledb_query_status_details_t() {
    this(tiledbJNI.new_tiledb_query_status_details_t(), true);
  }
}
