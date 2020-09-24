
include: "/views/99-generic_structure/structure_master_stats.view.lkml"

view: dj_master_stats {
  extends: [structure_master_stats]
    sql_table_name:
  {% if (ad._in_query or dj_master_stats.creative_id._in_query) %}
  @{DJ_PROJECT_NAME}.@{DJ_DATASET_NAME}.AdBasicStats_@{DJ_GOOGLE_ADS_ID}

  {% elsif (audience._in_query or dj_master_stats.audience_criterion_id._in_query) %}
  @{DJ_PROJECT_NAME}.@{DJ_DATASET_NAME}.AudienceBasicStats_@{DJ_GOOGLE_ADS_ID}

  {% elsif (keyword._in_query or dj_master_stats.criteria_id._in_query) %}
  @{DJ_PROJECT_NAME}.@{DJ_DATASET_NAME}.KeywordBasicStats_@{DJ_GOOGLE_ADS_ID}

  {% elsif (ad_group._in_query or dj_master_stats.ad_group_id._in_query) %}
  {% if dj_master_stats.hour_of_day._in_query %}
  @{DJ_PROJECT_NAME}.@{DJ_DATASET_NAME}.HourlyAdGroupStats_4@{DJ_GOOGLE_ADS_ID}

  {% else %}
  @{DJ_PROJECT_NAME}.@{DJ_DATASET_NAME}.AdGroupBasicStats_@{DJ_GOOGLE_ADS_ID}

  {% endif %}
  {% elsif (campaign._in_query or dj_master_stats.campaign_id._in_query) %}
  {% if dj_master_stats.hour_of_day._in_query %}
  @{DJ_PROJECT_NAME}.@{DJ_DATASET_NAME}.HourlyCampaignStats_@{DJ_GOOGLE_ADS_ID}

  {% else %}
  @{DJ_PROJECT_NAME}.@{DJ_DATASET_NAME}.CampaignBasicStats_@{DJ_GOOGLE_ADS_ID}

  {% endif %}
  {% else %}
  {% if dj_master_stats.hour_of_day._in_query %}
  @{DJ_PROJECT_NAME}.@{DJ_DATASET_NAME}.HourlyAccountStats_@{DJ_GOOGLE_ADS_ID}

  {% else %}
  @{DJ_PROJECT_NAME}.@{DJ_DATASET_NAME}.AccountBasicStats_@{DJ_GOOGLE_ADS_ID}

  {% endif %}
  {% endif %} ;;
}
