package main.scala

/**
  * Created on 24/07/2016.
  */
class HKVStoreException(message: String = null, cause: Throwable = null) extends
  RuntimeException(HKVStoreException.defaultMessage(message, cause), cause)

object HKVStoreException {
  def defaultMessage(message: String, cause: Throwable) =
    if (message != null) message
    else if (cause != null) cause.toString()
    else null
}


