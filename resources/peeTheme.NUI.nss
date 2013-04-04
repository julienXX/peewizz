@primaryFontName: HelveticaNeue;
@secondaryFontName: HelveticaNeue-Light;
@iconFontName: RailModel;
@primaryFontColor: #333333;
@primaryBackgroundColor: #E6E6E6;

Button {
    background-color: @primaryBackgroundColor;
    border-color: #A2A2A2;
    border-width: @primaryBorderWidth;
    font-color: @primaryFontColor;
    font-color-highlighted: #999999;
    font-name: @primaryFontName;
    font-size: 18;
    corner-radius: 7;
}
distanceLabel {
    font-name        : @iconFontName;
    color            : #EEEEEE;
    background-color : linear-gradient(#6D84B4, #c1ccdc);
    border-width     : 1px;
    border-color     : #086098;
    corner-radius    : 5px;
    font-size        : 15px;
    font-weight      : extra-bold;
    width            : 60px;
}
