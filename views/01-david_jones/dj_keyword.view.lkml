include: "/views/99-generic_structure/structure_keyword.view.lkml"
include: "/views/99-generic_structure/entity_base.view.lkml"
view: dj_keyword {
  extends: [entity_base,structure_keyword]
  sql_table_name: @{DJ_PROJECT_NAME}.@{DJ_DATASET_NAME}.Keyword_@{DJ_GOOGLE_ADS_ID} ;;

}
