include: "/views/**/*.view"

explore: dj_master_stats {
  persist_for: "24 hours"
  group_label: "01-David Jones"
  label: "01.021 Google Ads"

  join: keyword {
    view_label: "Keyword"
    sql_on: ${dj_master_stats.unique_key} = ${keyword.unique_key} AND
      ${dj_master_stats._data_raw} = ${keyword._data_raw} ;;
    relationship: many_to_one
  }
  join: audience {
    view_label: "Audience"
    sql_on: ${dj_master_stats.unique_key} = ${audience.unique_key} AND
      ${dj_master_stats._data_raw} = ${audience._data_raw} ;;
    relationship: many_to_one
  }
  join: ad {
    view_label: "Ads"
    sql_on: ${ad.creative_id} = ${dj_master_stats.creative_id} AND
      ${dj_master_stats._data_raw} = ${ad._data_raw} ;;
    relationship:  many_to_one
  }
  join: ad_group {
    view_label: "Ad Groups"
    sql_on: ${dj_master_stats.ad_group_id} = ${ad_group.ad_group_id} AND
      ${dj_master_stats._data_raw} = ${ad_group._data_raw} ;;
    relationship: many_to_one
  }
  join: campaign {
    view_label: "Campaigns"
    sql_on: ${dj_master_stats.campaign_id} = ${campaign.campaign_id} AND
      ${dj_master_stats._data_raw} = ${campaign._data_raw} AND  ${dj_master_stats._latest} = ${campaign._latest} ;;
    relationship: many_to_one
  }
  join: customer {
    view_label: "Customer"
    sql_on: ${dj_master_stats.external_customer_id} = ${customer.external_customer_id} AND
      ${dj_master_stats._data_raw} = ${customer._data_raw} ;;
    relationship: many_to_one
  }
}
