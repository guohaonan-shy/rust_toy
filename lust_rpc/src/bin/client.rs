use lazy_static::lazy_static;
use std::net::SocketAddr;

use lust_thrift::client::ClientBuilderExt;

lazy_static! {
    static ref CLIENT: lust_gen::lust::example::item::ItemServiceClient = {
        let addr: SocketAddr = "127.0.0.1:8080".parse().unwrap();
        lust_gen::lust::example::item::ItemServiceClientBuilder::new("lust.example.item")
            .address(addr)
            .byted()
            .build()
    };
}


#[lust::main]
async fn main() {
    let req = lust_gen::lust::example::item::GetItemRequest { id: 1024 };
    let resp = CLIENT.get_item(req).await;
    match resp {
        Ok(info) => tracing::info!("{:?}", info),
        Err(e) => tracing::error!("{:?}", e),
    }
}