select * from {{ metrics.calculate(
    
    metric('payments'),
    grain='month',
    dimensions=['status']
)
}}