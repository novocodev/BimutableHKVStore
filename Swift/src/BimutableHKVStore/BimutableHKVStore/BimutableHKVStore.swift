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
    
    func addBlock(block: Array<UInt8>) -> Future<Optional<Multihash>, NoError>;

    func addBlocks(blocks: Array<Array<UInt8>>) -> Future<Optional<Array<Multihash>>, NoError>;

    func getBlock(key: Multihash) -> Future<Optional<Array<UInt8>>, NoError>;

    func getBlocks(keys: Array<Multihash>) -> Future<Optional<Array<Array<UInt8>>>, NoError>;

    func deleteBlock(key: Multihash);

    func resolve(key: Multihash) -> Future<Optional<Array<Array<UInt8>>>, NoError>;
    
    func publish(secret: Array<UInt8>, rootBlockKey: Multihash) ->  Future<Optional<Multihash>, NoError>;
}
