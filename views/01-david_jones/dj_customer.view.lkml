include: "/views/99-generic_structure/structure_customer.view.lkml"
include: "/views/99-generic_structure/entity_base.view.lkml"
view: dj_customer {
  extends: [entity_base,structure_customer]
  sql_table_name: @{DJ_PROJECT_NAME}.@{DJ_DATASET_NAME}.customer_@{DJ_GOOGLE_ADS_ID} ;;

}
