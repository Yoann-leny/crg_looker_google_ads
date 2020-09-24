include: "/views/99-generic_structure/structure_ad.view.lkml"
include: "/views/99-generic_structure/entity_base.view.lkml"
view: dj_ad {
  extends: [entity_base,structure_ad]
  sql_table_name: @{DJ_PROJECT_NAME}.@{DJ_DATASET_NAME}.Ad_@{DJ_GOOGLE_ADS_ID} ;;

}
