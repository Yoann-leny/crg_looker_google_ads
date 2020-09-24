include: "/views/**/*.view"

explore: dj_master_stats {
  persist_for: "24 hours"
  group_label: "01-David Jones"
  label: "01.021 Google Ads"

  join: dj_keyword {
    view_label: "Keyword"
    sql_on: ${dj_master_stats.unique_key} = ${dj_keyword.unique_key} AND
      ${dj_master_stats._data_raw} = ${dj_keyword._data_raw} ;;
    relationship: many_to_one
  }
  join: dj_audience {
    view_label: "Audience"
    sql_on: ${dj_master_stats.unique_key} = ${dj_audience.unique_key} AND
      ${dj_master_stats._data_raw} = ${dj_audience._data_raw} ;;
    relationship: many_to_one
  }
  join: dj_ad {
    view_label: "Ads"
    sql_on: ${dj_ad.creative_id} = ${dj_master_stats.creative_id} AND
      ${dj_master_stats._data_raw} = ${dj_ad._data_raw} ;;
    relationship:  many_to_one
  }
  join: dj_ad_group {
    view_label: "Ad Groups"
    sql_on: ${dj_master_stats.ad_group_id} = ${dj_ad_group.ad_group_id} AND
      ${dj_master_stats._data_raw} = ${dj_ad_group._data_raw} ;;
    relationship: many_to_one
  }
  join: dj_campaign {
    view_label: "Campaigns"
    sql_on: ${dj_master_stats.campaign_id} = ${dj_campaign.campaign_id} AND
      ${dj_master_stats._data_raw} = ${dj_campaign._data_raw}  ;;
    relationship: many_to_one
  }
  join: dj_customer {
    view_label: "Customer"
    sql_on: ${dj_master_stats.external_customer_id} = ${dj_customer.external_customer_id} AND
      ${dj_master_stats._data_raw} = ${dj_customer._data_raw} ;;
    relationship: many_to_one
  }
}
