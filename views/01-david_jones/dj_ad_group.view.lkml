include: "/views/99-generic_structure/structure_ad_group.view.lkml"
include: "/views/99-generic_structure/entity_base.view.lkml"
view: dj_ad_group {
  extends: [entity_base,structure_ad_group]
  sql_table_name: @{DJ_PROJECT_NAME}.@{DJ_DATASET_NAME}.ad_group_@{DJ_GOOGLE_ADS_ID} ;;

}
