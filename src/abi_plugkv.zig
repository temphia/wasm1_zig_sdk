pub const PlugKV = struct {
    


};



// abi

extern "temphia1" fn plugkv_set(ctxid: usize, txid: usize, keyPtr: usize, keyLen: usize, valuePtr: usize, valueLen: usize, optsPtr: usize, optsLen: usize, respOffset: usize, respLen: usize) bool ;
extern "temphia1" fn plugkv_update(ctxid: usize, txid: usize, keyPtr: usize, keyLen: usize, valuePtr: usize, valueLen: usize, optsPtr: usize, optsLen: usize, respOffset: usize, respLen: usize ) bool;
extern "temphia1" fn plugkv_get(ctxid: usize, txid: usize, keyPtr: usize, keyLen: usize, respOffset: usize, respLen : usize) bool;
extern "temphia1" fn plugkv_del(ctxid: usize, txid: usize, keyPtr: usize, keyLen: usize, respOffset: usize, respLen: usize ) bool;
extern "temphia1" fn plugkv_del_batch(ctxid: usize, txid: usize, keyPtr: usize, keyLen: usize, respOffset: usize, respLen: usize) bool;
extern "temphia1" fn plugkv_query(ctxid: usize, txid: usize, optsPtr: usize, optsLen: usize, respOffset: usize, respLen: usize) bool;
extern "temphia1" fn plugkv_txn_new(ctxid: usize, txidPtr: usize, respOffset: usize, respLen: usize ) bool;
extern "temphia1" fn plugkv_txn_rollback(ctxid: usize, txid: usize, respOffset: usize, respLen : usize) bool;
extern "temphia1" fn plugkv_txn_commit(ctxid: usize, txid: usize, respOffset: usize, respLen : usize) bool;
