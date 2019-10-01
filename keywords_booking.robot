*** Settings ***
Resource    Variables.txt
Resource    keywords.robot


**Keywords**

Remember current week
    @{current_week}    BuiltIn.Create list
    :FOR    ${i}    IN RANGE    0    7
    \    BuiltIn.Set global variable    ${i}
    \    Get week day
    \    Collections.append to list    ${current_week}    ${week day}
    BuiltIn.Set global variable    @{current_week}

Get week day
    ${week day}    SeleniumLibrary.Get Text    xpath=//div[@data-testid="booking-day-picker-${i}"]/div[2]/div/div/div
    BuiltIn.Set global variable    ${week day}

Move to next week
    SeleniumLibrary.Click element    xpath=//div[contains(@class, 'IconButton___StyledButtonProto')]

Next week pattern
    Set days in month
    @{next_week_pattern}    BuiltIn.Create list
    :FOR    ${i}    IN RANGE    0    7
    \    BuiltIn.Set global variable    ${i}
    \    Get next week day pattern
    \    Collections.Append to list    ${next_week_pattern}    ${next_week_day_pattern}
    BuiltIn.Set global variable    @{next_week_pattern}

Get next week day pattern
    ${next_week_day_pattern}     BuiltIn.Evaluate    @{current_week}[${i}] + 7
    BuiltIn.Set global variable    ${next_week_day_pattern}
    BuiltIn.run keyword if    ${next_week_day_pattern} > ${days_in_month}    Get next week day next month
    ${next_week_day_pattern}    BuiltIn.convert to string    ${next_week_day_pattern}
    BuiltIn.Set global variable    ${next_week_day_pattern}

Get next week day next month
    ${next_week_day_pattern}     BuiltIn.Evaluate    ${next_week_day_pattern} - ${days_in_month}
    BuiltIn.Set global variable    ${next_week_day_pattern}


Verify movement to next week
    Collections.Lists should be equal    ${next_week_pattern}     ${current_week}

Get current month
    ${current_month}    DateTime.Get current date    UTC    result_format=%m
    BuiltIn.Set global variable    ${current_month}

Set days in month
    Get current month
    BuiltIn.Run keyword if    '${current_month}' == '1' or '${current_month}' == '3' or '${current_month}' == '5' or '${current_month}' == '7' or '${current_month}' == '7' or '${current_month}' == '10' or '${current_month}' == '12'    BuiltIn.Set global variable    ${days_in_month}    31
    BuiltIn.Run keyword if    '${current_month}' == '2'    BuiltIn.Set global variable    ${days_in_month}    28
    BuiltIn.Run keyword if    '${current_month}' == '4' or '${current_month}' == '6' or '${current_month}' == '9' or '${current_month}' == '11'    BuiltIn.Set global variable    ${days_in_month}    30
    ${days_in_month}    BuiltIn.convert to integer    ${days_in_month}
    BuiltIn.Set global variable    ${days_in_month}
