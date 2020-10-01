include: "/views/99-generic_structure/structure_campaign.view.lkml"
include: "/views/99-generic_structure/entity_base.view.lkml"
view: dj_campaign {
    extends: [entity_base,structure_campaign]
    sql_table_name: @{DJ_PROJECT_NAME}.@{DJ_DATASET_NAME}.Campaign_@{DJ_GOOGLE_ADS_ID} ;;

  dimension: campaign_category {
    type: string
    sql: Case
    when SPLIT(${campaign_name}, ' - ')[SAFE_OFFSET(2)] like "%DR%" AND SPLIT(${campaign_name}, ' | ')[SAFE_OFFSET(2)] like "%remarketing%" then "Programs"
    when SPLIT(${campaign_name}, ' - ')[SAFE_OFFSET(2)] like "%Programs%" then "Programs"
    when SPLIT(${campaign_name}, ' - ')[SAFE_OFFSET(2)] like "%Mixed%" then "Brands"
    when SPLIT(${campaign_name}, ' - ')[SAFE_OFFSET(2)] like "%Electrical%" then "Home & Electrical"
    when SPLIT(${campaign_name}, ' - ')[SAFE_OFFSET(2)] like "%Home%" then "Home & Electrical"
    when SPLIT(${campaign_name}, ' - ')[SAFE_OFFSET(2)] like "%Shoes%" then "Shoes & Accessories"
    when SPLIT(${campaign_name}, ' - ')[SAFE_OFFSET(2)] = "Menswear" then "Men"
    when SPLIT(${campaign_name}, ' - ')[SAFE_OFFSET(2)] = "Womenswear" then "Women"
    else SPLIT(${campaign_name}, ' - ')[SAFE_OFFSET(2)] end ;;
    drill_fields: [campaign_name]
  }
}
