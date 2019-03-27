<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="About.ascx.cs" Inherits="phasco.UI.About" %>

<asp:UpdateProgress ID="UpdateProgress1" runat="server">
    <ProgressTemplate>
        <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
            <tr>
                <td align="center" style="width: 100%; height: 11px">
                    <img src="../Images/loading1.gif" style="width: 27px; height: 5px" /></td>
            </tr>
        </table>
    </ProgressTemplate>
</asp:UpdateProgress>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <asp:MultiView ID="MultiView1" runat="server">
    <asp:View ID="View1" runat="server">
<table height="468" width="523" border="0" cellpadding="0" cellspacing="0"> 
        <tr>
          <td valign="top" background="../Imagess/bg-up25.jpg" height="208">
			<p align="right" class="style6" dir="rtl"><span lang="fa"><span style="font-weight: 400"><font size="2">
			</font></span></span><font size="2"><span style="font-weight: 400">
			درباره ما</span></font></p>
			<p align="justify" style="margin-left: 40px; color: #000000;" dir="rtl"> </p>
			<table border="0" width="523" id="table1" dir="rtl" style="border-collapse: collapse">
				<tr>
					<td width="29">

											</td>
					<td width="120"></td>
					<td width="368"></td>
				</tr>
				<tr>
					<td width="29">

											</td>
					<td width="120" align="center">
                        <asp:ImageButton ID="ImageButton_Bazargani" runat="server" ImageUrl="~/Images/Bazargani.jpg"
                            OnClick="ImageButton_Bazargani_Click" /><a href="Biz.asp"></a></td>
					<td width="368"></td>
				</tr>
				<tr>
					<td width="29">

											</td>
					<td width="120" align="center"><a href="Biz.asp">واحد بازرگانی</a></td>
					<td width="368"></td>
				</tr>
				<tr>
					<td width="29">

											</td>
					<td width="120" align="center"></td>
					<td width="368"></td>
				</tr>
				</table>
			<table border="0" width="523" id="table3" style="border-collapse: collapse">
				<tr>
					<td width="33%" align="center"><a href="Qu.asp">
					</a>
                        <asp:ImageButton ID="ImageButton_Control" runat="server" ImageUrl="~/Images/Control.jpg"
                            OnClick="ImageButton_Control_Click" /></td>
					<td width="33%" align="center"><a href="ana.asp">
					</a>
                        <asp:ImageButton ID="ImageButton_Tahghigh" runat="server" ImageUrl="~/Images/Tahghigh.jpg"
                            OnClick="ImageButton_Tahghigh_Click" /></td>
					<td width="33%" align="center">
					<a href="De.asp">
					</a>
                        <asp:ImageButton ID="ImageButton_Tolid" runat="server" ImageUrl="~/Images/Tolid.jpg"
                            OnClick="ImageButton_Tolid_Click" /></td>
				</tr>
				<tr>
					<td width="33%" align="center"><a href="Qu.asp">واحد كنترل كيفي</a></td>
					<td width="33%" align="center"><a href="ana.asp">واحد تحقيق و توسعه</a></td>
					<td width="33%" align="center"><a href="De.asp">واحد توليد </a>
					</td>
				</tr>
				<tr>
					<td width="33%" align="center"><a href="Pu.asp">
					</a>
                        <asp:ImageButton ID="ImageButton_Omomi" runat="server" ImageUrl="~/Images/Ravabet.jpg" OnClick="ImageButton_Omomi_Click" /></td>
					<td width="33%" align="center"><a href="Sa.asp">
					</a>
                        <asp:ImageButton ID="ImageButton_Foroosh" runat="server" ImageUrl="~/Images/Forosh.jpg"
                            OnClick="ImageButton_Foroosh_Click" /></td>
					<td width="33%" align="center"><a href="Post.asp">
					</a>
                        <asp:ImageButton ID="ImageButton_Post" runat="server" ImageUrl="~/Images/Ersal.jpg"
                            OnClick="ImageButton_Post_Click" /></td>
				</tr>
				<tr>
					<td width="33%" align="center"><a href="Pu.asp">واحد روابط عمومی</a></td>
					<td width="33%" align="center"><a href="Sa.asp">واحد فروش</a></td>
					<td width="33%" align="center"><a href="Post.asp">واحد ارسال سفارشات</a></td>
				</tr>
				<tr>
					<td width="33%" align="center"></td>
					<td width="33%" align="center"></td>
					<td width="33%" align="center"></td>
				</tr>
				<tr>
					<td width="33%" align="center"></td>
					<td width="33%" align="center"></td>
					<td width="33%" align="center"></td>
				</tr>
			</table>
			</td> 
        </tr>
		<tr>
          <td valign="top"  height="13" background="../Imagess/bg.jpg" width="523"> </td> 
        </tr>
      </table>
    </asp:View>
    <asp:View ID="View2" runat="server">
        <table id="Table2" border="0" width="100%">
            <tr>
                <td>
                    </td>
                <td width="317">
                    <p dir="rtl">
                        واحد بازرگانی</p>
                </td>
            </tr>
            <tr>
                <td>
                   
                        <img border="0" height="115" src="Images/010.jpg"
                            style="text-decoration: underline" width="170" />
                  
                </td>
                <td style="color: #a5a5a5" width="317">
                    <p align="justify" dir="rtl">
                        این واحد با تکیه بر اصول پایه ای تجارت بین المللی شرایطی فراهم آورده تا کیت های
                        با کیفیت برتر از تولیدکننده های واقعی دنیا را علاوه بر اینکه با مناسب ترین قیمت
                        وارد نماید بلکه آنها را با بهترین کیفیت در اختیار مراکز مصرف کننده قرار دهد.
                        <br />
                        در این راستا توانمندی خود را جهت واردات کیت های کاملاًَ اختصاصی ازاروپا و امریکا
                        با توجه به روابط مستحکم دو جانبه با شرکای خارجی خود در حد اقل زمان ممکن به اثبات
                        رسانده است .
                        <br />
                        </p>
                </td>
            </tr>
        </table>
    </asp:View>
    <asp:View ID="View3" runat="server">
        <table id="Table4" border="0" style="border-collapse: collapse" width="100%">
            <tr>
                <td width="172">
             
                        <img border="0" height="113" src="Images/039.jpg"
                            style="text-decoration: underline" width="170" />
                        
                </td>
                <td style="color: #a5a5a5" valign="top">
                    <p align="right">
                        واحد توليد</p>
                </td>
            </tr>
            <tr>
                <td width="172">
                   
                        <img border="0" height="113" src="Images/046.jpg"
                            style="text-decoration: underline" width="170" />
         
                </td>
                <td style="color: #a5a5a5">
                    <p align="justify" dir="rtl">
                        در راستای ارتقای کيفيت کيتهای مصرفی در آزمايشگاه های کشور ، شرکت تحقيقاتی توليدی
                        فارمد آوران سبز اقدام به شناسايی کمپانی های معتبر دنيا در زمينة توليد کيتهای ايمونولوژی
                        و سرولوژی نموده و شرايط مناسبی را برای واردات اين کيتها فراهم آورده است .</p>
                </td>
            </tr>
            <tr>
                <td width="172">
               
                        <img border="0" height="113" src="Images/052.jpg"
                            style="text-decoration: underline" width="170" />
                      
                </td>
                <td style="color: #a5a5a5">
                    <p align="justify" dir="rtl">
                        از آنجا که رساندن اين محصولات به دست مصرف کننده در شرايط کاملاً مطلوب جزء وظايف
                        مهم شرکت می باشد ، واحد کنترل کيفی ، نظارت دقيقی بر اين توليدات اعمال ميکند . به
                        نحوی که شرايط دمايی کيتها تا قبل از رسيدن آنها به واحد توليدی شرکت ارزيابی شده و
                        نگهداری آنها تا قبل از رسيدن به دست مراکز مصرف کننده تحت نظارت واحد کنترل کيفی به
                        طور جدی پيگيری می شود .</p>
                </td>
            </tr>
            <tr>
                <td width="172">
                 
                        <img border="0" height="113" src="Images/DSC_0045.jpg"
                            style="text-decoration: underline" width="170" />
                
                </td>
                <td style="color: #a5a5a5">
                    <p dir="rtl">
                        همچنين اگر نياز به بسته بندی کيتها در داخل شرکت باشد اين امر طبق دستورالعملها و
                        شرايط خاص دمايی زير نظر واحد کنترل کيفی انجام می پذيرد .</p>
                </td>
            </tr>
        </table>
    </asp:View>
    <asp:View ID="View4" runat="server">
        <table id="Table5" border="0" style="border-collapse: collapse" width="80%">
            <tr>
                <td rowspan="2" width="67">
                   
                        <img border="0" height="200" src="Images/089.jpg"
                            style="text-decoration: underline" width="141" />
                      
                </td>
                <td align="justify" dir="rtl" style="color: #a5a5a5" width="452">
                    واحد تحقيق و توسعة شرکت تحقيقاتی توليدی فارمد آوران سبز پس از سالها تجربه در زمينة
                    کيتهای الايزا ، بر آن شده است تا با بهره گيری از متخصصان داخلی و نيز حمايت و دانش
                    فنی شرکای خارجی خود اقدام به تهيه و توليد کيتهای الايزا در داخل کشور نمايد .</td>
            </tr>
            <tr>
                <td align="justify" dir="rtl" width="452">
                    </td>
            </tr>
            <tr>
                <td rowspan="2" width="67">
                 
                        <img border="0" height="200" src="Images/107.jpg"
                            style="text-decoration: underline" width="141" />
                      
                </td>
                <td align="justify" dir="rtl" style="color: #a5a5a5" width="452">
                    <br />
                    در همين راستا بر آن است تا با استفاده از مواد درجه يک و تجهيزات مدرن و پيشرفته گامی
                    هرچند کوچک در جهت بی نيازی کشور در زمينة داروهای تشخيصی بردارد .</td>
            </tr>
            <tr>
                <td align="justify" dir="rtl" width="452">
                    </td>
            </tr>
            <tr>
                <td colspan="2" width="521">
                    </td>
            </tr>
        </table>
    </asp:View>
    <asp:View ID="View5" runat="server">
        <table id="Table6" border="0" width="100%">
            <tr>
                <td>
                    </td>
                <td width="307">
                    <p dir="rtl">
                        </p>
                    <p dir="rtl">
                        </p>
                    <p dir="rtl">
                        </p>
                    <p dir="rtl">
                        </p>
                </td>
            </tr>
            <tr>
                <td>
                    </td>
                <td width="307">
                    <p dir="rtl">
                        واحد كنترل كيفي</p>
                    <p>
                        </p>
                    <p>
                        </p>
                </td>
            </tr>
            <tr>
                <td>
                 
                        <img border="0" height="116" src="Images/111.jpg"
                            style="text-decoration: underline" width="174" />
                     
                </td>
                <td style="color: #a5a5a5" valign="top" width="307">
                    <p dir="rtl">
                        در اين واحد سعي مي گردد تا با بهره گيري از لوازم و تجهيزات كامل و پيشرفته عمليات
                        كنترل كيفي به بهترين نحو انجام پذيرد .</p>
                    <p>
                        </p>
                    <p>
                        </p>
                </td>
            </tr>
            <tr>
                <td>
                   
                        <img border="0" height="205" src="Images/048.jpg"
                            style="text-decoration: underline" width="174" />
                    
                </td>
                <td style="color: #a5a5a5" valign="top" width="307">
                    <p align="justify" dir="rtl">
                        در آزمايشگاه كنترل كيفي شركت يك نمونه از تمامي كيتهاي وارداتي , صرف نظر از كليه
                        تاييديه ها و گواهي هاي بين المللي توسط سرم كنترلهاي استاندارد مورد ارزيابي قرار
                        گرفته و يك گزارش كتبي از نتايج آنها در آرشيو اين واحد نگهداري شده و در صورت داشتن
                        كيفيت مطلوب , روانه بازار مصرف داخلي ميگردند
                    </p>
                    <p>
                        </p>
                </td>
            </tr>
            <tr>
                <td>
            
                        <img border="0" height="262" src="Images/092.jpg"
                            style="text-decoration: underline" width="174" />
                          
                </td>
                <td style="color: #a5a5a5" valign="top" width="307">
                    <p align="justify" dir="rtl">
                        علاوه بر اين چنانچه يكي از مراكز آزمايشگاهي مصرف كننده با كيتي از اين شركت كه داراي
                        ليبل طلايي انحصاري شركت تحقيقاتي توليدي فارمد آوران سبز ميباشد دچار اشكال گردد ,
                        واحد كنترل كيفي خود را متعهد می داند که در كوتاه ترین زمان ممكن اشکال را بررسی کرده
                        و با همکاری مرکز آزمایشگاهی مسئله را حل نماید .</p>
                    <p>
                        </p>
                </td>
            </tr>
        </table>
    </asp:View>
    <asp:View ID="View6" runat="server">
        <table id="Table7" border="0" width="100%">
            <tr>
                <td>
                    </td>
                <td align="right" dir="rtl">
                    <p align="justify" dir="rtl" style="margin-left: 40px; color: #000000">
                        واحد ارسال سفارشات
                    </p>
                    <p>
                        </p>
                    <p>
                        </p>
                </td>
            </tr>
            <tr>
                <td>
                  
                        <img border="0" height="262" src="Images/sefareshat.jpg"
                            width="174" /></td>
                <td align="right" dir="rtl" rowspan="2">
                    <p align="justify">
                        فعالیت واحد ارسال سفارشات شرکت تحقیقاتی تولیدی فارمد آوران سبز تحت نظارت کنترل
                        کیفی و طبق اصول خاص آن انجام می پذیرد.</p>
                    <p align="justify">
                        <br />
                        از<span lang="en-us"> </span>آنجا<span lang="en-us"> </span>که<span lang="en-us">
                        </span>سفارشات<span lang="en-us"> </span>ارجاع<span lang="en-us"> </span>
                        شده<span lang="en-us"> </span>به<span lang="en-us"> </span>این<span
                            lang="en-us"> </span>شرکت<span lang="en-us"> </span>از<span lang="en-us">
                            </span>سراسر<span lang="en-us"> </span>کشور<br />
                        می باشند ، بسته بندی صحیح و رعایت زنجیره سرد در کلیه محموله های ارسالی از
                        وظائف اصلی این واحد بوده و این امر در کوتاه ترین زمان ممکن صورت می گیرد .</p>
                    <p align="justify">
                        <br />
                        از طرف دیگر با تعهدی که این واحد در قبال مراکز مصرف کننده در خود احساس می کند ،
                        تا حصول اطمینان از دریافت صحیح و بموقع بسته های ارسالی ، با مرکز مربوطه در ارتباط
                        نزدیک خواهد بود.</p>
                    <p>
                        </p>
                </td>
            </tr>
            <tr>
                <td>
             
                        <img border="0" height="116" src="Images/post2.jpg"
                            width="174" /></td>
            </tr>
        </table>
    </asp:View>
    <asp:View ID="View7" runat="server">
        <table id="Table8" border="0" style="border-collapse: collapse" width="100%">
            <tr>
                <td>
                   
                        <img border="0" height="181" src="Images/021022.jpg"
                            style="text-decoration: underline" width="512" />
                     
                </td>
            </tr>
            <tr style="color: #a5a5a5">
                <td>
                    <p dir="rtl">
                        واحد فروش این شرکت با پیروی از اصل تثبیت قیمتها ارتباط مستقیم و صمیمانه ای را با
                        مراکز آزمایشگاهی سراسر کشور بر قرار کرده و سعی دارد نیازهای مربوطه این مراکز را
                        در اسرع وقت برطرف نماید .
                        <br />
                        در عین حال با توجه به گسترش کار و پیوستن مراکز جدید به جمع مصرف کنندگان محصولات
                        این شرکت ، از همکاری شرکتهای توزیع کننده نیز در سراسر کشور بهره خواهد گرفت.</p>
                </td>
            </tr>
            <tr>
                <td>
                    <p align="center">
                     
                            <img border="0" height="320" src="Images/056060.jpg"
                                style="text-decoration: underline" width="400" />
                      
                    </p>
                </td>
            </tr>
        </table>
    </asp:View>
    <asp:View ID="View8" runat="server">
        <table id="Table10" border="0" width="100%">
            <tr>
                <td width="33%">
                    </td>
                <td dir="rtl" width="66%">
                    واحد روابط عمومی</td>
            </tr>
            <tr>
                <td width="33%">
                 
                        <img border="0" height="241" src="Images/008.jpg"
                            style="text-decoration: underline" width="170" />
                    
                </td>
                <td dir="ltr" style="color: #a5a5a5" width="66%">
                    <p align="justify" dir="rtl" style="margin-left: 40px; color: #000000">
                        واحد روابط عمومی شرکت تحقیقاتی تولیدی فارمد آوران سبز با تأکید بر اصل کیفیت در آزمایشگاه
                        خدماتی را تدارک دیده و آنها را بصورت رایگان در اختیار مراکز آزمایشگاهی سراسر کشور
                        قرار می دهد . مراکز مربوطه در صورت تمایل می توانند با  
                            <span>تکمیل فرم عضويت</span>  در سايت ، از این خدمات
                        استفاده نمایند .</p>
                    <p>
                        </p>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <table id="Table9" border="0" width="100%">
                        <tr>
                            <td height="33%">
                        
                                    <img border="0" height="116" src="Images/001.jpg"
                                        style="text-decoration: underline" width="165" />
                           
                            </td>
                            <td height="33%" style="color: #a5a5a5">
                               
                                    <img border="0" height="116" src="Images/006.jpg"
                                        width="165" /><span style="color: #a5a5a5"> 
                                    
                            </td>
                            <td height="33%" style="color: #a5a5a5">
                              
                                    <img border="0" height="119" src="Images/064.jpg"
                                        style="text-decoration: underline" width="165" />
                                 
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </asp:View>
    <asp:View ID="View9" runat="server">
    </asp:View>
</asp:MultiView>
    </ContentTemplate>
</asp:UpdatePanel>
