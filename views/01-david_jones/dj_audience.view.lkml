include: "/views/99-generic_structure/structure_audience.view.lkml"
include: "/views/99-generic_structure/entity_base.view.lkml"
view: dj_audience {
  extends: [entity_base,structure_audience]
  sql_table_name: @{DJ_PROJECT_NAME}.@{DJ_DATASET_NAME}.Audience_@{DJ_GOOGLE_ADS_ID} ;;

}
