<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
        <style>
            #calendar-outer {
                display: inline-block;
                border: 1px solid lightgray;
            }
            #calendar-outer>div>div { /*칸 낱개 스타일*/
                box-sizing: border-box;
                width:58px;
                height:40px;
                border:1px solid lightgray;
                margin:0px; 
                float: left;
            }
            #week>div { /*요일줄 스타일*/
                background-color: whitesmoke;
                line-height: 40px;
                text-align: center;
                font-size: 16px;
                font-weight: 600;
                color:rgb(63, 63, 63);
            }
            .line>div { /*날짜줄 스타일*/
                padding:2px;
                line-height: 36px;
                font-size: 12px;
                color:rgb(168, 166, 166);
                text-align: left;
            }
            
        </style>
    </head>

    <body> 
        <div id="calendar-outer">
            <div id="week">
                <div>sun</div>
                <div>mon</div>
                <div>tue</div>
                <div>wed</div>
                <div>thu</div>
                <div>fri</div>
                <div>sat</div>
            </div><br clear="both">
            <div id="line-1st" class="line">
                <div>29</div>
                <div>30</div>
                <div>31</div>
                <div>1</div>
                <div>2</div>
                <div>3</div>
                <div>4</div>
            </div><br clear="both">
            <div id="line-2nd" class="line">
                <div>5</div>
                <div>6</div>
                <div>7</div>
                <div>8</div>
                <div>9</div>
                <div>10</div>
                <div>11</div>
            </div><br clear="both">
            <div id="line-3rd" class="line">
                <div>12</div>
                <div>13</div>
                <div>14</div>
                <div>15</div>
                <div>16</div>
                <div>17</div>
                <div>18</div>
            </div><br clear="both">
            <div id="line-4th" class="line">
                <div>19</div>
                <div>20</div>
                <div>21</div>
                <div>22</div>
                <div>23</div>
                <div>24</div>
                <div>25</div>
            </div><br clear="both">
            <div id="line-5th" class="line">
                <div>26</div>
                <div>27</div>
                <div>28</div>
                <div>1</div>
                <div>2</div>
                <div>3</div>
                <div>4</div>
            </div>
        </div>
        
        <script>
                  

        </script>

    </body>

    </html>