<center>
<h1>Project 3 results visualization</h1>
<img src="confusion_matrix.png">

<br>
Accuracy (mean of diagonal of confusion matrix) is 0.525
<p>

<table border=0 cellpadding=4 cellspacing=1>
<tr>
<th>Category name</th>
<th>Accuracy</th>
<th colspan=2>Sample training images</th>
<th colspan=2>Sample true positives</th>
<th colspan=2>False positives with true label</th>
<th colspan=2>False negatives with wrong predicted label</th>
</tr>
<tr>
<td>Kitchen</td>
<td>0.530</td>
<td bgcolor=LightBlue><img src="thumbnails/Kitchen_image_0179.jpg" width=57 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Kitchen_image_0169.jpg" width=101 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Kitchen_image_0116.jpg" width=100 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Kitchen_image_0010.jpg" width=100 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/InsideCity_image_0111.jpg" width=75 height=75><br><small>InsideCity</small></td>
<td bgcolor=LightCoral><img src="thumbnails/InsideCity_image_0125.jpg" width=75 height=75><br><small>InsideCity</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Kitchen_image_0154.jpg" width=100 height=75><br><small>Store</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Kitchen_image_0118.jpg" width=57 height=75><br><small>Bedroom</small></td>
</tr>
<tr>
<td>Store</td>
<td>0.500</td>
<td bgcolor=LightBlue><img src="thumbnails/Store_image_0130.jpg" width=102 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Store_image_0131.jpg" width=112 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Store_image_0010.jpg" width=104 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Store_image_0140.jpg" width=98 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/LivingRoom_image_0065.jpg" width=75 height=75><br><small>LivingRoom</small></td>
<td bgcolor=LightCoral><img src="thumbnails/LivingRoom_image_0129.jpg" width=55 height=75><br><small>LivingRoom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Store_image_0117.jpg" width=71 height=75><br><small>Bedroom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Store_image_0027.jpg" width=100 height=75><br><small>LivingRoom</small></td>
</tr>
<tr>
<td>Bedroom</td>
<td>0.440</td>
<td bgcolor=LightBlue><img src="thumbnails/Bedroom_image_0127.jpg" width=115 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Bedroom_image_0070.jpg" width=109 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Bedroom_image_0161.jpg" width=100 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Bedroom_image_0175.jpg" width=100 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Office_image_0117.jpg" width=98 height=75><br><small>Office</small></td>
<td bgcolor=LightCoral><img src="thumbnails/TallBuilding_image_0107.jpg" width=75 height=75><br><small>TallBuilding</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Bedroom_image_0069.jpg" width=100 height=75><br><small>Industrial</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Bedroom_image_0131.jpg" width=114 height=75><br><small>Store</small></td>
</tr>
<tr>
<td>LivingRoom</td>
<td>0.300</td>
<td bgcolor=LightBlue><img src="thumbnails/LivingRoom_image_0012.jpg" width=101 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/LivingRoom_image_0188.jpg" width=100 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/LivingRoom_image_0037.jpg" width=113 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/LivingRoom_image_0114.jpg" width=98 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Store_image_0109.jpg" width=101 height=75><br><small>Store</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Bedroom_image_0068.jpg" width=74 height=75><br><small>Bedroom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/LivingRoom_image_0078.jpg" width=113 height=75><br><small>Kitchen</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/LivingRoom_image_0106.jpg" width=101 height=75><br><small>Kitchen</small></td>
</tr>
<tr>
<td>Office</td>
<td>0.580</td>
<td bgcolor=LightBlue><img src="thumbnails/Office_image_0198.jpg" width=117 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Office_image_0097.jpg" width=104 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Office_image_0083.jpg" width=108 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Office_image_0142.jpg" width=98 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/InsideCity_image_0067.jpg" width=75 height=75><br><small>InsideCity</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Coast_image_0114.jpg" width=75 height=75><br><small>Coast</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Office_image_0084.jpg" width=107 height=75><br><small>LivingRoom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Office_image_0119.jpg" width=108 height=75><br><small>Kitchen</small></td>
</tr>
<tr>
<td>Industrial</td>
<td>0.240</td>
<td bgcolor=LightBlue><img src="thumbnails/Industrial_image_0235.jpg" width=113 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Industrial_image_0004.jpg" width=117 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Industrial_image_0015.jpg" width=55 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Industrial_image_0046.jpg" width=57 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Store_image_0060.jpg" width=57 height=75><br><small>Store</small></td>
<td bgcolor=LightCoral><img src="thumbnails/OpenCountry_image_0107.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Industrial_image_0115.jpg" width=94 height=75><br><small>TallBuilding</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Industrial_image_0084.jpg" width=112 height=75><br><small>Kitchen</small></td>
</tr>
<tr>
<td>Suburb</td>
<td>0.770</td>
<td bgcolor=LightBlue><img src="thumbnails/Suburb_image_0110.jpg" width=113 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Suburb_image_0133.jpg" width=113 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Suburb_image_0084.jpg" width=113 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Suburb_image_0094.jpg" width=113 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Highway_image_0142.jpg" width=75 height=75><br><small>Highway</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Coast_image_0081.jpg" width=75 height=75><br><small>Coast</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Suburb_image_0147.jpg" width=113 height=75><br><small>Store</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Suburb_image_0004.jpg" width=113 height=75><br><small>Bedroom</small></td>
</tr>
<tr>
<td>InsideCity</td>
<td>0.370</td>
<td bgcolor=LightBlue><img src="thumbnails/InsideCity_image_0018.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/InsideCity_image_0143.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/InsideCity_image_0085.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/InsideCity_image_0079.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Industrial_image_0123.jpg" width=120 height=75><br><small>Industrial</small></td>
<td bgcolor=LightCoral><img src="thumbnails/LivingRoom_image_0068.jpg" width=100 height=75><br><small>LivingRoom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/InsideCity_image_0137.jpg" width=75 height=75><br><small>Industrial</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/InsideCity_image_0119.jpg" width=75 height=75><br><small>Kitchen</small></td>
</tr>
<tr>
<td>TallBuilding</td>
<td>0.500</td>
<td bgcolor=LightBlue><img src="thumbnails/TallBuilding_image_0214.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/TallBuilding_image_0144.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/TallBuilding_image_0022.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/TallBuilding_image_0061.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Industrial_image_0081.jpg" width=105 height=75><br><small>Industrial</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Industrial_image_0115.jpg" width=94 height=75><br><small>Industrial</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/TallBuilding_image_0111.jpg" width=75 height=75><br><small>Industrial</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/TallBuilding_image_0080.jpg" width=75 height=75><br><small>Industrial</small></td>
</tr>
<tr>
<td>Street</td>
<td>0.520</td>
<td bgcolor=LightBlue><img src="thumbnails/Street_image_0237.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Street_image_0107.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Street_image_0136.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Street_image_0147.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Industrial_image_0072.jpg" width=122 height=75><br><small>Industrial</small></td>
<td bgcolor=LightCoral><img src="thumbnails/TallBuilding_image_0131.jpg" width=75 height=75><br><small>TallBuilding</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Street_image_0018.jpg" width=75 height=75><br><small>InsideCity</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Street_image_0140.jpg" width=75 height=75><br><small>InsideCity</small></td>
</tr>
<tr>
<td>Highway</td>
<td>0.770</td>
<td bgcolor=LightBlue><img src="thumbnails/Highway_image_0217.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Highway_image_0160.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Highway_image_0011.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Highway_image_0124.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Store_image_0078.jpg" width=107 height=75><br><small>Store</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Coast_image_0099.jpg" width=75 height=75><br><small>Coast</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Highway_image_0125.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Highway_image_0137.jpg" width=75 height=75><br><small>Suburb</small></td>
</tr>
<tr>
<td>OpenCountry</td>
<td>0.510</td>
<td bgcolor=LightBlue><img src="thumbnails/OpenCountry_image_0328.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/OpenCountry_image_0342.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/OpenCountry_image_0033.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/OpenCountry_image_0110.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Coast_image_0077.jpg" width=75 height=75><br><small>Coast</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Highway_image_0002.jpg" width=75 height=75><br><small>Highway</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/OpenCountry_image_0097.jpg" width=75 height=75><br><small>Coast</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/OpenCountry_image_0040.jpg" width=75 height=75><br><small>TallBuilding</small></td>
</tr>
<tr>
<td>Coast</td>
<td>0.450</td>
<td bgcolor=LightBlue><img src="thumbnails/Coast_image_0091.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Coast_image_0212.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Coast_image_0045.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Coast_image_0072.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Mountain_image_0062.jpg" width=75 height=75><br><small>Mountain</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Bedroom_image_0176.jpg" width=57 height=75><br><small>Bedroom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Coast_image_0067.jpg" width=75 height=75><br><small>Highway</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Coast_image_0092.jpg" width=75 height=75><br><small>Highway</small></td>
</tr>
<tr>
<td>Mountain</td>
<td>0.580</td>
<td bgcolor=LightBlue><img src="thumbnails/Mountain_image_0135.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Mountain_image_0151.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Mountain_image_0060.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Mountain_image_0121.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/OpenCountry_image_0038.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Forest_image_0017.jpg" width=75 height=75><br><small>Forest</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Mountain_image_0107.jpg" width=75 height=75><br><small>TallBuilding</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Mountain_image_0062.jpg" width=75 height=75><br><small>Coast</small></td>
</tr>
<tr>
<td>Forest</td>
<td>0.810</td>
<td bgcolor=LightBlue><img src="thumbnails/Forest_image_0152.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Forest_image_0108.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Forest_image_0014.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Forest_image_0057.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Mountain_image_0010.jpg" width=75 height=75><br><small>Mountain</small></td>
<td bgcolor=LightCoral><img src="thumbnails/OpenCountry_image_0063.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Forest_image_0012.jpg" width=75 height=75><br><small>Mountain</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Forest_image_0082.jpg" width=75 height=75><br><small>OpenCountry</small></td>
</tr>
<tr>
<th>Category name</th>
<th>Accuracy</th>
<th colspan=2>Sample training images</th>
<th colspan=2>Sample true positives</th>
<th colspan=2>False positives with true label</th>
<th colspan=2>False negatives with wrong predicted label</th>
</tr>
</table>
</center>


