pub struct S;

impl lust_gen::lust::example::item::ItemService for S {
    async fn get_item(
        &self,
        _req: lust_gen::lust::example::item::GetItemRequest,
    ) -> ::core::result::Result<
        lust_gen::lust::example::item::GetItemResponse,
        ::volo_thrift::ServerError,
    > {
        ::std::result::Result::Ok(lust_gen::lust::example::item::GetItemResponse{
            item: lust_gen::lust::example::item::Item {
                id: 1024,
                title: "ghn title".into(),
                content: "test content".into(),
                extra: None,
            }

        })
    }
}
