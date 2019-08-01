###### COMPANIES ######
Company.create(name: "Acarte Technology Services", username: "acarte", password_digest: "$2a$10$CW6CugfNtDnMY55ncRPPAOL460S8Eyx2x9zZzt1.uwGMIA5Ti2ice")
Company.create(name: "Clearfuze Networks", username: "clearfuze", password_digest: "$2a$10$CW6CugfNtDnMY55ncRPPAOL460S8Eyx2x9zZzt1.uwGMIA5Ti2ice")
Company.create(name: "Fairoaks IT", username: "fairoaks", password_digest: "$2a$10$CW6CugfNtDnMY55ncRPPAOL460S8Eyx2x9zZzt1.uwGMIA5Ti2ice")
Company.create(name: "SmartPath Technologies", username: "smartpath", password_digest: "$2a$10$CW6CugfNtDnMY55ncRPPAOL460S8Eyx2x9zZzt1.uwGMIA5Ti2ice")
Company.create(name: "Trust Technologies", username: "trustit", password_digest: "$2a$10$CW6CugfNtDnMY55ncRPPAOL460S8Eyx2x9zZzt1.uwGMIA5Ti2ice")
Company.create(name: "Tomorrow Technology Today", username: "ttecht", password_digest: "$2a$10$CW6CugfNtDnMY55ncRPPAOL460S8Eyx2x9zZzt1.uwGMIA5Ti2ice")

###### EMPLOYEES ######
## ACARTE ##
Employee.create(first_name: "Anthony", last_name: "Costa", pay_type: "Hourly", pay_rate: "24.00", company_id: 1)
Employee.create(first_name: "Antoinette", last_name: "Holmlund", pay_type: "Salary", pay_rate: "1000.00", company_id: 1)
Employee.create(first_name: "Robert", last_name: "Holmlund", pay_type: "Hourly", pay_rate: "12.00", company_id: 1)

## CLEARFUZE ##
Employee.create(first_name: "Craig", last_name: "Ashley", pay_type: "Hourly", pay_rate: "28.85", company_id: 2)
Employee.create(first_name: "Glen", last_name: "Forsythe", pay_type: "Hourly", pay_rate: "27.00", company_id: 2)
Employee.create(first_name: "Dylan", last_name: "Elkin", pay_type: "Salary", pay_rate: "3533.33", company_id: 2)
Employee.create(first_name: "W. Jason", last_name: "Gilbert", pay_type: "Salary", pay_rate: "4583.33", company_id: 2)
Employee.create(first_name: "Emilio", last_name: "Hoschet", pay_type: "Salary", pay_rate: "3791.67", company_id: 2)
Employee.create(first_name: "Ryan", last_name: "Rennie-McCormack", pay_type: "Salary", pay_rate: "3791.67", company_id: 2)

## FAIROAKS ##
Employee.create(first_name: "Alex", last_name: "Bickford", pay_type: "Salary", pay_rate: "1923.08", company_id: 3)
Employee.create(first_name: "Jennifer", last_name: "Brown", pay_type: "Salary", pay_rate: "1923.08", company_id: 3)
Employee.create(first_name: "Jennifer", last_name: "Butler", pay_type: "Salary", pay_rate: "2346.15", company_id: 3)
Employee.create(first_name: "Christopher", last_name: "Cady", pay_type: "Salary", pay_rate: "2500.00", company_id: 3)
Employee.create(first_name: "Adam", last_name: "Crossley", pay_type: "Salary", pay_rate: "3846.16", company_id: 3)
Employee.create(first_name: "Thomas", last_name: "Crossley", pay_type: "Salary", pay_rate: "3269.23", company_id: 3)
Employee.create(first_name: "Steven", last_name: "DaSilva", pay_type: "Salary", pay_rate: "2500.00", company_id: 3)
Employee.create(first_name: "Mario", last_name: "Farw", pay_type: "Salary", pay_rate: "1923.08", company_id: 3)
Employee.create(first_name: "Lynn", last_name: "Kleimola", pay_type: "Salary", pay_rate: "2192.30", company_id: 3)
Employee.create(first_name: "Jonathon", last_name: "Wallask", pay_type: "Salary", pay_rate: "2884.62", company_id: 3)

## SMARTPATH ##
Employee.create(first_name: "Christopher", last_name: "Barnard", pay_type: "Salary", pay_rate: "250.00", company_id: 4)
Employee.create(first_name: "Grant", last_name: "Burgess", pay_type: "Salary", pay_rate: "643.75", company_id: 4)
Employee.create(first_name: "Gavin", last_name: "Green", pay_type: "Hourly", pay_rate: "13.50", company_id: 4)
Employee.create(first_name: "Terri", last_name: "Noles", pay_type: "Hourly", pay_rate: "15.00", company_id: 4)
Employee.create(first_name: "Brett", last_name: "Hill", pay_type: "Salary", pay_rate: "378.00", company_id: 4)
Employee.create(first_name: "Carol", last_name: "Hoffmann", pay_type: "Salary", pay_rate: "731.10", company_id: 4)
Employee.create(first_name: "J. Willie", last_name: "Kerns", pay_type: "Salary", pay_rate: "1400.00", company_id: 4)
Employee.create(first_name: "Kristy", last_name: "Kerns", pay_type: "Salary", pay_rate: "640.00", company_id: 4)
Employee.create(first_name: "Aaron", last_name: "Kunkel", pay_type: "Salary", pay_rate: "882.90", company_id: 4)
Employee.create(first_name: "Jerrico", last_name: "Melton", pay_type: "Salary", pay_rate: "896.90", company_id: 4)
Employee.create(first_name: "George", last_name: "Rich", pay_type: "Salary", pay_rate: "1397.80", company_id: 4)
Employee.create(first_name: "Matthew", last_name: "Shaw", pay_type: "Salary", pay_rate: "817.30", company_id: 4)

Payroll.create(company_id: 4 , start_date: Date.new(2019, 4, 1), end_date: Date.new(2019, 4, 8), check_date: Date.new(2019, 4, 10), status: "Created")
Paycheck.create(payroll_id: 1, employee_id: 20, hours: 40 )
Paycheck.create(payroll_id: 1, employee_id: 21, hours: 40 )
Paycheck.create(payroll_id: 1, employee_id: 22, hours: 7 )
Paycheck.create(payroll_id: 1, employee_id: 23, hours: 7.25 )
Paycheck.create(payroll_id: 1, employee_id: 24, hours: 40 )
Paycheck.create(payroll_id: 1, employee_id: 25, hours: 40 )
Paycheck.create(payroll_id: 1, employee_id: 26, hours: 40 )
Paycheck.create(payroll_id: 1, employee_id: 27, hours: 40 )
Paycheck.create(payroll_id: 1, employee_id: 28, hours: 40 )
Paycheck.create(payroll_id: 1, employee_id: 29, hours: 40 )
Paycheck.create(payroll_id: 1, employee_id: 30, hours: 40 )
Paycheck.create(payroll_id: 1, employee_id: 31, hours: 40 )

## TRUSTIT ##
Employee.create(first_name: "Adam", last_name: "Breitenbach", pay_type: "Hourly", pay_rate: "24.39", company_id: 5)

## TTECHT ##
Employee.create(first_name: "Lisa", last_name: "Urwin", pay_type: "Salary", pay_rate: "1000.00", company_id: 6)
