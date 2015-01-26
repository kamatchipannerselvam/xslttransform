<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
                xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:env="http://schemas.xmlsoap.org/soap/envelope"
                xmlns:math="http://exslt.org/math"
                xmlns:xfun="http://exslt.org/function"
                xmlns:myfunc="http://kreativbooking.com"
                exclude-result-prefixes="msxsl xsl xsi env xsd xfun math myfunc">
<xsl:output method="html" omit-xml-declaration="no" encoding="utf-8" indent="yes" />
<xsl:template match="/">
<xsl:function name="myfunc:funct1">
    <xsl:param name="string1"/>
    <xsl:param name="string2"/>
    <xsl:value-of select="compare(upper-case($string1),upper-case($string2))"/>
</xsl:function>



<div>
compareCI red,blue: <xsl:value-of select="myfunc:funct1('red','blue')"/>
</div>

<div id="property-list">
<xsl:for-each select="Envelope/env:Body/env:OTA_HotelAvailRS/env:RoomStays/env:RoomStay">
<form>
<div class="hotel-details">
<!-- Get basic property details -->
<xsl:for-each select="env:BasicPropertyInfo">
<div id="hdetails">   
<div class="hname"><strong><xsl:value-of select="@HotelName"/></strong><input type="hidden" name="hotelcode" value="{@HotelCode}"  /></div>
<div id="map_rate">
<div class="starrate">Start rating: <xsl:value-of select="env:Award/@Rating"/></div>
<div class="geolc">Geolocation: {<xsl:value-of select="env:Position/@Latitude"/>,<xsl:value-of select="env:Position/@Longitude"/>}</div>
</div>
<div id="address">
<div class="hadd">Address: <xsl:value-of select="env:Address/@AddressLine1"/>,<xsl:value-of select="env:Address/@AddressLine2"/>, <xsl:value-of select="env:Address/@Area"/></div>
<div class="hadd"><xsl:value-of select="env:Address/env:CityName"/>-<xsl:value-of select="env:Address/env:PostalCode"/></div>
<div class="hadd"><xsl:value-of select="env:Address/env:State"/>-<xsl:value-of select="env:Address/env:CountryName"/></div>
</div>

<div class="description"><strong>Description</strong><p><xsl:value-of select="env:HotelDescription"/></p></div>
<div class="hfeature"><strong>Hotel features</strong>
<ul>
<xsl:for-each select="env:HotelFeatures/env:FeatureDescription">
<li><xsl:value-of select="@Description"/></li>
</xsl:for-each>	
</ul>
</div>

</div>
<div id="hotelimages">
<xsl:variable name="xind" select="(count(env:HotelImages/env:ImagePath))"/>
<!-- select random pictures from hotel images-->
<xsl:variable name="zxind" select="(floor(math:random()*$xind) mod $xind) + 1" />
<xsl:for-each select="env:HotelImages">
<img src="{env:ImagePath[$zxind]}" class="img-responsive" width="150px" galleryimg="no" />
</xsl:for-each>	
</div>
</xsl:for-each>
</div>

<!-- Get Room details for particular property-->
<xsl:for-each select="env:RoomTypes">
<div><!--- main room details div start -->
<xsl:for-each select="env:RoomType">
<div> <!---table room details div start -->

<!--- COl1 Room Image and Name -->
<div>
<div><strong><xsl:value-of select="env:RoomDescription/@Text"/></strong></div> <!--- title -->
<div><img src="{env:RoomDescription/env:ImagePath}"/></div><!--- Image -->
<div> 
<ul>
<xsl:for-each select="env:RoomAmenities/env:AmenityDescription">
	<li><xsl:value-of select="@Description"/></li>
</xsl:for-each>	
</ul>
</div><!--- facilities -->

</div>
<!--- COl2 room rate and details -->
<div>
<!--- room rate plan is compared with room rate -->
    
    
</div>
<!--- COl3 Book Now button -->
<div></div>
</div> <!--- table room details div end -->
</xsl:for-each>
</div><!--- main room details div end -->
</xsl:for-each>

<xsl:function name="myfunc:funct1">
    <xsl:param name="string1"/>
    <xsl:param name="string2"/>
    <xsl:value-of select="compare(upper-case($string1),upper-case($string2))"/>
</xsl:function>



<div>
compareCI red,blue: <xsl:value-of select="myfunc:funct1('red','blue')"/>
</div>

<xsl:for-each select="env:RatePlans/env:RatePlan">
<xsl:variable name="rpcode" select="@RatePlanCode"/>
<div><xsl:value-of select="$rpcode"/></div>
</xsl:for-each>

<xsl:for-each select="env:RoomRates/env:RoomRate">
<xsl:variable name="RoomRate_rpc" select="@RatePlanCode"/>
<div><xsl:value-of select="$RoomRate_rpc"/></div>
</xsl:for-each>


        
</form>
</xsl:for-each>
</div>
</xsl:template>
</xsl:stylesheet>
<!--<div id="carousel-himages" class="carousel slide" data-ride="carousel">
<ol class="carousel-indicators">
<xsl:for-each select="env:HotelImages/env:ImagePath">
<xsl:variable name="xindex" select="position() - 1 "/>
<xsl:choose>
<xsl:when test="position() = 1">   
<li data-target="#carousel-himage" data-slide-to="{$xindex}" class="active"></li>
</xsl:when>
<xsl:otherwise>
<li data-target="#carousel-himage" data-slide-to="{$xindex}"></li>    
</xsl:otherwise>
</xsl:choose>
</xsl:for-each>
</ol>

 Wrapper for slides 
  <div class="carousel-inner">
    <xsl:for-each select="env:HotelImages/env:ImagePath">
    <xsl:choose>
    <xsl:when test="position() = 1">   
        <div class="item active">
          <img src="{.}" alt="..."/>
        </div>
    </xsl:when>    
    <xsl:otherwise>
        <div class="item">
          <img src="{.}" alt="..."/>
        </div>
    </xsl:otherwise>    
    </xsl:choose>
    </xsl:for-each>
    </div>
 Controls 
  <a class="left carousel-control" href="#carousel-himage" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
  </a>
  <a class="right carousel-control" href="#carousel-himage" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
  </a>
</div>  Carousel     -->
