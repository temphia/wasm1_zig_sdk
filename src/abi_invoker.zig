extern "temphia1" fn invoker_name(ctxid: usize, respOffset: usize, respLen: usize) usize;
extern "temphia1" fn invoker_exec(ctxid: usize, nPtr: usize, nLen: usize, dPtr: usize, dLen: usize, respOffset: usize, respLen: usize) usize;
extern "temphia1" fn invoker_ctx_user(ctxid: usize, respOffset: usize, respLen: usize) usize;
extern "temphia1" fn invoker_ctx_user_info(ctxid: usize, respOffset: usize, respLen: usize) usize;
extern "temphia1" fn invoker_ctx_message(ctxid: usize, dPtr: usize, dLen: usize, respOffset: usize, respLen: usize) usize;

