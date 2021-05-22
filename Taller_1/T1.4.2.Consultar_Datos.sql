/*Querys descriptivos de las tablas*/
// Por restricciones en atlas se montaron solamente 10 mil datos por cada tabla.

/*Customers*/
// Customers by City
db.olist_customers_dataset.aggregate(
    [
        {
            $group : {
                _id : '$customer_city',
                Q : {$sum : 1},
                
            },
        },
         {
            $sort:{ Q : -1 }
          },
    ] 
)

// Customers by State
db.olist_customers_dataset.aggregate(
  [
      {
          $group : {
              _id : '$customer_state',
              Q : {$sum : 1},
              
          },
      },
       {
          $sort:{ Q : -1 }
        },
  ] 
)


// customer_id count = total rows
db.olist_customers_dataset.distinct('customer_id').length;

// customer_unique_id count < total rows
db.olist_customers_dataset.distinct('customer_unique_id').length;


/*Geolocation Dataset*/
// States Count
db.olist_geolocation_dataset.aggregate(
  [
      {
          $group : {
              _id : '$geolocation_state',
              Q : {$sum : 1},
              
          },
      },
       {
          $sort:{ Q : -1 }
        },
  ] 
)

// Cities Count
db.olist_geolocation_dataset.aggregate(
  [
      {
          $group : {
              _id : '$geolocation_city',
              Q : {$sum : 1},
              
          },
      },
       {
          $sort:{ Q : -1 }
        },
  ] 
)

// Operation Area
db.olist_geolocation_dataset.aggregate(
  [
      {
          $group : {
              _id : null,
              Max_Lat : {$max : "$geolocation_lat"},
              Min_Lat : {$min : "$geolocation_lat"},
              Max_Long : {$max : "$geolocation_lng"},
              Min_Long : {$min : "$geolocation_lng"},
              
          },
      },
  ] 
)

/*Order Items*/
// Most Sold Products (Top 10)
db.olist_order_items_dataset.aggregate(
  [
    {$group: {
      _id: "$product_id",
      Q: {
        $sum: 1
      }
    }}, 
    {$lookup: {
      from: 'olist_products_dataset',
      localField: '_id',
      foreignField: 'product_id',
      as: 'products_dataset'
    }}, 
    {$unwind: { path:'$products_dataset'}}, 
    {$project: {
      sells:"$Q",
      category: "$products_dataset.product_category_name"
    }}, 
    {$sort: {
      sells: -1
    }},
    { "$limit": 10 }
  ] 
)



// Less Sold Products (Top 10)
db.olist_order_items_dataset.aggregate(
  [
    {$group: {
      _id: "$product_id",
      Q: {
        $sum: 1
      }
    }}, 
    {$lookup: {
      from: 'olist_products_dataset',
      localField: '_id',
      foreignField: 'product_id',
      as: 'products_dataset'
    }}, 
    {$unwind: { path:'$products_dataset'}}, 
    {$project: {
      sells:"$Q",
      category: "$products_dataset.product_category_name"
    }}, 
    {$sort: {
      sells: 1
    }},
    { "$limit": 10 }
  ] 
)



// Top 10 Sellers
db.olist_order_items_dataset.aggregate(
  [
      {
          $group : {
              _id : '$seller_id',
              Q : {$sum : 1},
              
          },
      },
       {
          $sort:{ Q : -1 }
        },
        { "$limit": 10 }
  ] 
)

// Price Description
db.olist_order_items_dataset.aggregate(
  [
      {
          $group : {
              _id : null,
              Max_Price : {$max : "$price"},
              Min_Price : {$min : "$price"},
              Avg_Price : {$avg : "$price"},
              
          },
      },
  ] 
)


/*Payments Dataset*/
// Payment Type
db.olist_order_payments_dataset.aggregate(
  [
      {
          $group : {
              _id : '$payment_type',
              Q : {$sum : 1},
              
          },
      },
       {
          $sort:{ Q : -1 }
        },
  ] 
)


// Payment value by type
db.olist_order_payments_dataset.aggregate(
  [
      {
          $group : {
              _id : '$payment_type',
              Max_payment : {$max : "$payment_value"},
              Avg_payment : {$avg : "$payment_value"},
              Min_payment : {$min : "$payment_value"},
              
          },
      },
       {
          $sort:{ Avg_payment : -1 }
        },
  ] 
)


// --Payment Installments
db.olist_order_payments_dataset.aggregate(
  [
      {
          $group : {
              _id : '$payment_installments',
              Q : {$sum : 1},
              
          },
      },
       {
          $sort:{ Q : -1 }
        },
  ] 
)

// Payment value by installments
db.olist_order_payments_dataset.aggregate(
  [
      {
          $group : {
              _id : '$payment_installments',
              Max_payment : {$max : "$payment_value"},
              Avg_payment : {$avg : "$payment_value"},
              Min_payment : {$min : "$payment_value"},
              
          },
      },
       {
          $sort:{ Avg_payment : -1 }
        },
  ] 
)


/*Reviews*/
// --Reviews by order
db.olist_order_reviews_dataset.aggregate(
  [
      {
          $group : {
              _id : '$review_id',
              Q : {$sum : 1},
              
          },
      },
       {
          $sort:{ Q : -1 }
        },
  ] 
)

// Most Reviewed Order
db.olist_order_reviews_dataset.aggregate(
  [
      {
          $group : {
              _id : '$order_id',
              Q : {$sum : 1},
              
          },
      },
       {
          $sort:{ Q : -1 }
        },
  ] 
)


// Scores
db.olist_order_reviews_dataset.aggregate(
  [
      {
          $group : {
              _id : null,
              Max_Score : {$max : "$review_score"},
              Min_Score : {$min : "$review_score"},
              Avg_Score : {$avg : "$review_score"},
              
          },
      },
  ] 
)


/*Orders*/
// Best Clients (orders by client)
db.olist_orders_dataset.aggregate(
  [
    {$group: {
      _id: "$customer_id",
      Q: {
        $sum: 1
      }
    }}, 
    {$lookup: {
      from: 'olist_customers_dataset',
      localField: '_id',
      foreignField: 'customer_id',
      as: 'customer_dataset'
    }}, 
    {$unwind: { path:'$customer_dataset'}}, 
    {$project: {
      orders:"$Q",
      customer_unique_id: "$customer_dataset.customer_unique_id"
    }}, 
    {$sort: {
      orders: -1
    }}
  ] 
)




// Delivery Time
db.olist_orders_dataset.aggregate([
  { 
    $project: {
    dateDifference: { 
      $subtract: [ 
                  {$dateFromString:{
                    dateString:"$order_delivered_customer_date",
                    format:"%Y-%m-%d %H:%M:%S"
                  }}, 
                  {$dateFromString:{
                    dateString:"$order_purchase_timestamp",
                    format:"%Y-%m-%d %H:%M:%S"
                  }}],
                }
                },
              },
    {
      $project: {delivered_days:{$divide: ["$dateDifference", 1000 * 60 * 60 * 24]}}  
      },
    {$group: {
      _id : null,
                Max_Days : {$max : "$delivered_days"},
                Min_Days : {$min : "$delivered_days"},
                Avg_Days : {$avg : "$delivered_days"},
    }},
])


// Efficiency time
db.olist_orders_dataset.aggregate([
  { 
    $project: {
    dateDifference: { 
      $subtract: [ 
                  {$dateFromString:{
                    dateString:"$order_estimated_delivery_date",
                    format:"%Y-%m-%d %H:%M:%S"
                  }}, 
                  {$dateFromString:{
                    dateString:"$order_purchase_timestamp",
                    format:"%Y-%m-%d %H:%M:%S"
                  }}],
                }
                },
              },
    {
      $project: {estimated_days:{$divide: ["$dateDifference", 1000 * 60 * 60 * 24]}}  
      },
    {$group: {
      _id : null,
                Max_Estimated_Days : {$max : "$estimated_days"},
                Min_Estimated_Days : {$min : "$estimated_days"},
                Avg_Estimated_Days : {$avg : "$estimated_days"},
    }},
])

/*Products*/
// Categories
db.olist_products_dataset.distinct("product_category_name").length

// Most Common Product Category
db.olist_products_dataset.aggregate(
  [
      {
          $group : {
              _id : '$product_category_name',
              Q : {$sum : 1},
              
          },
      },
       {
          $sort:{ Q : -1 }
        },
        {$limit:10}
  ] 
)

// Less Common
db.olist_products_dataset.aggregate(
  [
      {
          $group : {
              _id : '$product_category_name',
              Q : {$sum : 1},
              
          },
      },
       {
          $sort:{ Q : 1 }
        },
        {$limit:10}
  ] 
)

// Quantities Description
db.olist_products_dataset.aggregate(
  [
      {
          $group : {
              _id : null,
              Max_Photos : {$max : "$product_photos_qty"},
              Min_Photos : {$min : "$product_photos_qty"},
              Avg_Photos : {$avg : "$product_photos_qty"},
              
          },
      },
  ] 
)


db.olist_products_dataset.aggregate(
  [
      {
          $group : {
              _id : null,
              Max_height : {$max : "$product_height_cm"},
              Min_height : {$min : "$product_height_cm"},
              Avg_height : {$avg : "$product_height_cm"},
              
          },
      },
  ] 
)

db.olist_products_dataset.aggregate(
  [
      {
          $group : {
              _id : null,
              Max_length : {$max : "$product_length_cm"},
              Min_length : {$min : "$product_length_cm"},
              Avg_length : {$avg : "$product_length_cm"},
              
          },
      },
  ] 
)

db.olist_products_dataset.aggregate(
  [
      {
          $group : {
              _id : null,
              Max_Weight : {$max : "$product_weight_g"},
              Min_Weight : {$min : "$product_weight_g"},
              Avg_Weight : {$avg : "$product_weight_g"},
              
          },
      },
  ] 
)

db.olist_products_dataset.aggregate(
  [
      {
          $group : {
              _id : null,
              Max_Width : {$max : "$product_width_cm"},
              Min_Width : {$min : "$product_width_cm"},
              Avg_Width : {$avg : "$product_width_cm"},
              
          },
      },
  ] 
)

/*Sellers*/
// Sellers City
db.olist_sellers_dataset.aggregate(
  [
      {
          $group : {
              _id : '$seller_city',
              Q : {$sum : 1},
              
          },
      },
       {
          $sort:{ Q : -1 }
        },
        {$limit:10}
  ] 
)

db.olist_sellers_dataset.aggregate(
  [
      {
          $group : {
              _id : '$seller_city',
              Q : {$sum : 1},
              
          },
      },
       {
          $sort:{ Q : 1 }
        },
        {$limit:10}
  ] 
)

// Sellers State
db.olist_sellers_dataset.aggregate(
  [
      {
          $group : {
              _id : '$seller_state',
              Q : {$sum : 1},
              
          },
      },
       {
          $sort:{ Q : -1 }
        },
        {$limit:10}
  ] 
)

db.olist_sellers_dataset.aggregate(
  [
      {
          $group : {
              _id : '$seller_state',
              Q : {$sum : 1},
              
          },
      },
       {
          $sort:{ Q : 1 }
        },
        {$limit:10}
  ] 
)


/*Category Name Translation*/
db.product_category_name_translation.distinct("product_category_name").length
db.product_category_name_translation.distinct("product_category_name_english").length



