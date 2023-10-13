# LTA Tennis Court Booking

## Acknowledgement

Thanks very much to dragomir.enachi.uk@gmail.com who solved the problem I was trying to!


## Did it save your time?

If so, please donate to the original developer: http://paypal.me/dragomirenachi

## Why and how?

Tennis courts can booked 6 days in advance, the booking slot opens at midnight. Finsbury Park provides free courts that get booked quickly and often don't get used. I want to automate this process.

The test script is using selenium, jest chromedriver and delay.

Jenkins will trigger the build each day at 23:53, Jenkins will perform setup, and the script will wait(using delay) till next hour starts (00:00:01) to continue booking.

The script will try to book court 1, and if that fails (someone else booked it) - will try to book court 2 in Fimsbury Park through to court 8.

It will use username and password to login to [https://auth.clubspark.uk/account/signin](https://auth.clubspark.uk/account/signin)

Jenkins build trigger set to:

TZ=Europe/London

53 23 * * 0,1,2,3,4,5,6,7

To reuse the script you would need to provide:

- Environment variable to login to Club Spark website LTA_USERNAME and LTA_PASSWORD
- Booking location needs to be changed from https://clubspark.lta.org.uk/ActonPark2/ to your location
- Court ids need to be adjusted in the book.test.js file to match your booking location
