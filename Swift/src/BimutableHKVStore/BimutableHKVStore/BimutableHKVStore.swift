//
//  BimutableHKVStore.swift
//  BimutableHKVStore
//
//  Copyright © 2016 Novoĉo. All rights reserved.
//

import Foundation
import SwiftMultihash
import BrightFutures
import Result

protocol BimutableHKVStore {

    /*
     * Add a data block to the store
     * If a completion handler is provided it will be called with the block key when the block has 
     * been committed to the store. The method will return a nil Optional
     * If no completion handler is passed a Future is returned that will contain the block key if it was successfully stored or an error if not.
     */
    func addBlock(block: Array<UInt8>, completion: Optional<(key: Result<Multihash, NoError>) -> Void>) -> Optional<Future<Multihash, NoError>>;

    /*
     * Add multiple data block to the store
     * If a completion handler is provided it will be called with the block keys when the blocks have
     * been committed to the store. The method will return a nil Optional
     * If no completion handler is passed a Future is returned that will contain the block keys if they were successfully stored or an error if not.
     */
    func addBlocks(blocks: Array<Array<UInt8>>, completion: Optional<(keys: Array<Result<Multihash, NoError>>) -> Void>) -> Optional<Future<Array<Multihash>, NoError>>;

    /*
     * get block from the store for the given key, if the store does not contain the block it may attempt to retrieve the block from external services.
     * If a completion handler is provided it will be called with the block.
     * If no completion handler is passed a Future is returned that will contain the block or an error.
     */
    func getBlock(key: Multihash, completion: Optional<(value: Result<Array<UInt8>, NoError>) -> Void>) -> Optional<Future<Array<UInt8>, NoError>>;

    /*
     * get multiple blocks from the store for the given keys, if the store does not contain any of the blocks it may attempt to retrieve the blocks from external services.
     * If a completion handler is provided it will be called with the blocks.
     * If no completion handler is passed a Future is returned that will contain the blocks or an error.
     */
    func getBlocks(keys: Array<Multihash>, completion: Optional<(values: Result<Array<Array<UInt8>>, NoError>) -> Void>) -> Optional<Future<Array<Array<UInt8>>, NoError>>;

    /*
     * Delete the block associated with the key.
     */
    func deleteBlock(key: Multihash) -> Void;

    /*
     * Resolve the blocks associated with the mutable key.
     * If a completion handler is provided it will be called with the resolved blocks
     * If no completion handler is provided 
     */
    func resolve(key: Multihash, completion: Optional<(values: Result<Array<Array<UInt8>>, NoError>) -> Void>) -> Optional<Future<Array<Array<UInt8>>, NoError>>;
    
    func publish(secret: Array<UInt8>, rootBlockKey: Multihash, completion: Optional<(key: Result<Multihash, NoError>) -> Void>) ->  Optional<Future<Multihash, NoError>>;
}
