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
    
    func addBlock(block: Array<UInt8>, completion: Optional<(key: Multihash) -> Void>) -> Future<Optional<Multihash>, NoError>;

    func addBlocks(blocks: Array<Array<UInt8>>, completion: Optional<(keys: Array<Multihash>) -> Void>) -> Future<Optional<Array<Multihash>>, NoError>;

    func getBlock(key: Multihash, completion: Optional<(value: Array<UInt8>) -> Void>) -> Future<Optional<Array<UInt8>>, NoError>;

    func getBlocks(keys: Array<Multihash>, completion: Optional<(values: Array<Array<UInt8>>) -> Void>) -> Future<Optional<Array<Array<UInt8>>>, NoError>;

    func deleteBlock(key: Multihash) -> Void;

    func resolve(key: Multihash, completion: Optional<(values: Array<Array<UInt8>>) -> Void>) -> Future<Optional<Array<Array<UInt8>>>, NoError>;
    
    func publish(secret: Array<UInt8>, rootBlockKey: Multihash, completion: Optional<(key: Multihash) -> Void>) ->  Future<Optional<Multihash>, NoError>;
}
