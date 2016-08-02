package main.scala

import akka.actor.ActorRef
import io.mediachain.multihash.MultiHash
import scala.concurrent.Future
/**
  * Created on 07/07/2016.
  */
trait BimutableHKVStore {
  @throws(classOf[HKVStoreException])
  def addBlock(block: Array[Byte], callback: Option[ActorRef]): Option[Future[MultiHash]]

  @throws(classOf[HKVStoreException])
  def addBlocks(blocks: Array[Array[Byte]], callback: Option[ActorRef]): Option[Future[Array[MultiHash]]]

  @throws(classOf[HKVStoreException])
  def getBlock(key: MultiHash, callback: Option[ActorRef]): Option[Future[Array[Byte]]]

  @throws(classOf[HKVStoreException])
  def getBlocks(keys: Array[MultiHash], callback: Option[ActorRef]): Option[Future[Array[Array[Byte]]]]

  @throws(classOf[HKVStoreException])
  def deleteBlock(key: MultiHash)

  @throws(classOf[HKVStoreException])
  def resolve(key: MultiHash, callback: Option[ActorRef]): Option[Future[Array[Array[Byte]]]]

  def publish(secret: Array[Byte], rootBlockKey: MultiHash, callback: Option[ActorRef]): Option[Future[MultiHash]]
}
