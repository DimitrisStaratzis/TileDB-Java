/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 4.0.2
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */

package io.tiledb.libtiledb;

public enum tiledb_datatype_t {
  TILEDB_INT32(0),
  TILEDB_INT64(1),
  TILEDB_FLOAT32(2),
  TILEDB_FLOAT64(3),
  TILEDB_CHAR(4),
  TILEDB_INT8(5),
  TILEDB_UINT8(6),
  TILEDB_INT16(7),
  TILEDB_UINT16(8),
  TILEDB_UINT32(9),
  TILEDB_UINT64(10),
  TILEDB_STRING_ASCII(11),
  TILEDB_STRING_UTF8(12),
  TILEDB_STRING_UTF16(13),
  TILEDB_STRING_UTF32(14),
  TILEDB_STRING_UCS2(15),
  TILEDB_STRING_UCS4(16),
  TILEDB_ANY(17),
  TILEDB_DATETIME_YEAR(18),
  TILEDB_DATETIME_MONTH(19),
  TILEDB_DATETIME_WEEK(20),
  TILEDB_DATETIME_DAY(21),
  TILEDB_DATETIME_HR(22),
  TILEDB_DATETIME_MIN(23),
  TILEDB_DATETIME_SEC(24),
  TILEDB_DATETIME_MS(25),
  TILEDB_DATETIME_US(26),
  TILEDB_DATETIME_NS(27),
  TILEDB_DATETIME_PS(28),
  TILEDB_DATETIME_FS(29),
  TILEDB_DATETIME_AS(30),
  TILEDB_TIME_HR(31),
  TILEDB_TIME_MIN(32),
  TILEDB_TIME_SEC(33),
  TILEDB_TIME_MS(34),
  TILEDB_TIME_US(35),
  TILEDB_TIME_NS(36),
  TILEDB_TIME_PS(37),
  TILEDB_TIME_FS(38),
  TILEDB_TIME_AS(39),
  TILEDB_BLOB(40),
  TILEDB_BOOL(41);

  public final int swigValue() {
    return swigValue;
  }

  public static tiledb_datatype_t swigToEnum(int swigValue) {
    tiledb_datatype_t[] swigValues = tiledb_datatype_t.class.getEnumConstants();
    if (swigValue < swigValues.length
        && swigValue >= 0
        && swigValues[swigValue].swigValue == swigValue) return swigValues[swigValue];
    for (tiledb_datatype_t swigEnum : swigValues)
      if (swigEnum.swigValue == swigValue) return swigEnum;
    throw new IllegalArgumentException(
        "No enum " + tiledb_datatype_t.class + " with value " + swigValue);
  }

  @SuppressWarnings("unused")
  private tiledb_datatype_t() {
    this.swigValue = SwigNext.next++;
  }

  @SuppressWarnings("unused")
  private tiledb_datatype_t(int swigValue) {
    this.swigValue = swigValue;
    SwigNext.next = swigValue + 1;
  }

  @SuppressWarnings("unused")
  private tiledb_datatype_t(tiledb_datatype_t swigEnum) {
    this.swigValue = swigEnum.swigValue;
    SwigNext.next = this.swigValue + 1;
  }

  private final int swigValue;

  private static class SwigNext {
    private static int next = 0;
  }
}
