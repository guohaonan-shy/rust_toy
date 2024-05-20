use std::net::SocketAddr;

use lust_thrift::server::BytedServerExt;

use lust_example_item::S;

#[lust::main]
async fn main() {
    let addr: SocketAddr = "[::]:8080".parse().unwrap();

    lust_gen::lust::example::item::ItemServiceServer::new(S)
        .byted()
        .run(addr)
        .await
        .unwrap();
}
