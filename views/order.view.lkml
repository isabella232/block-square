view: order {
  sql_table_name: Square.`ORDER` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: closed {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.closed_at ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.created_at ;;
  }

  dimension: location_id {
    type: number
    sql: ${TABLE}.location_id ;;
  }

  dimension: net_amount {
    type: number
    sql: ${TABLE}.net_amount ;;
  }

  dimension: order_source_name {
    type: string
    sql: ${TABLE}.order_source_name ;;
  }

  dimension: reference_id {
    type: number
    sql: ${TABLE}.reference_id ;;
  }

  dimension: return_amount {
    type: number
    sql: ${TABLE}.return_amount ;;
  }

  dimension: rounding_adjustment {
    type: number
    sql: ${TABLE}.rounding_adjustment ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: total_discount_money {
    type: number
    sql: ${TABLE}.total_discount_money ;;
  }

  dimension: total_money {
    type: number
    sql: ${TABLE}.total_money ;;
  }

  dimension: total_service_charge_money {
    type: number
    sql: ${TABLE}.total_service_charge_money ;;
  }

  dimension: total_tax_money {
    type: number
    sql: ${TABLE}.total_tax_money ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.updated_at ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      order_source_name,
      transaction.count,
      order_service_charge.count,
      tender.count,
      order_line_item_tax.count,
      order_line_item.count,
      refund.count,
      order_fulfillment.count
    ]
  }
}