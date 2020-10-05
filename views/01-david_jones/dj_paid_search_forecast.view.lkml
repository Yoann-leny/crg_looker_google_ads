view: dj_paid_search_forecast {
  sql_table_name: `@{DJ_PROJECT_NAME}.@{DJ_FORECAST_DATASET}.paid_search_forecast` ;;

  dimension: week_start_date {
    type: string
    sql: CAST(${TABLE}.week_start_date as DATE);;
  }

  dimension: budget_target_tmp {
    hidden: yes
    type: number
    sql: ${TABLE}.budget_target ;;
  }

  dimension: sessions_target_tmp {
    hidden: yes
    type: number
    sql: ${TABLE}.Sessions_Target ;;
  }

  dimension: transactions_target_tmp {
    hidden: yes
    type: number
    sql: ${TABLE}.Transactions_Target ;;
  }

  dimension: revenue_target_tmp {
    hidden: yes
    type: number
    sql: ${TABLE}.Revenue_Target ;;
  }

  measure: budget_target {
    type: sum
    sql: ${budget_target_tmp} ;;
  }

  measure: sessions_target {
    type: sum
    sql: ${sessions_target_tmp} ;;
  }

  measure: transactions_target {
    type: sum
    sql: ${transactions_target_tmp} ;;
  }

  measure: revenue_target {
    type: sum
    sql: ${revenue_target_tmp} ;;
  }
}
