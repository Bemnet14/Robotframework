*** Settings ***
Library           SeleniumLibrary
Resource        ..resource\testcases\testlocators.robot


*** Variables ***
${URL12}          https://demowebshop.tricentis.com/register  
${password}       admin123
${vnaam}        (//input[@id='FirstName'])[1]


#Homepage
${Zoekveld locator}    //input[@id='small-searchterms']
${Zoekknop locator}   //input[@class='search-box-button']
${Log in-link locator}   //a[contains(text(),'Log in')]
${Register-link locator}   //a[contains(text(),'Register')]
${Product 'Build your own computer' locator}   //h2[contains(text(),'Build your own computer')]
${Productafbeelding locator}   //img[@alt='Picture of Build your own computer']
${'Add to cart'-knop locator voor specifiek product}   //input[contains(@onclick,'/addproducttocart/catalog/1/1/1')]
${Winkelwagenpictogram locator}   //span[@class='cart-qty']
${Log out-link locator als ingelogd}   //a[contains(text(),'Log out')]

#Books Computers etc
${Books-categorie link}   //a[contains(text(),'Books')]
${Computers-categorie link}   //a[contains(text(),'Computers')]
${Electronics-categorie link}   //a[contains(text(),'Electronics')]
${Apparel-categorie link}   //a[contains(text(),'Apparel')]
${Digital downloads-categorie link}   //a[contains(text(),'Digital downloads')]
${Jewelry-categorie link}   //a[contains(text(),'Jewelry')]
${Gift cards-categorie link}   //a[contains(text(),'Gift Cards')]

#https://demowebshop.tricentis.com/computers
${Destkop}   (//img[@title='Show products in category Desktops'])[1]

#https://demowebshop.tricentis.com/desktops
${Desktops-categorie link}   //a[contains(text(),'Desktops')]
${First product title}   //h2[@class='product-title']/a
${First product price}   //div[@class='prices']//span[@class='price actual-price']
${Add to cart button for first product}   //div[@class='product-item']//input[@value='Add to cart']
${Shopping cart link}   //span[@class='cart-qty']
${Go to cart button in cart flyout}   //div[@id='flyout-cart']//input[@value='Go to cart']
${Shopping cart page title}   //h1[text()='Shopping cart']
${Product price in cart}   //span[@class='product-subtotal']
${Agree checkbox in cart}   //input[@id='termsofservice']




 


