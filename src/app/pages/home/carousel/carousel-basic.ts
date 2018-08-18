import { Component, OnInit } from "@angular/core";
import { map } from "rxjs/operators";

@Component({
  selector: "app-carousel-basic",
  templateUrl: "./carousel-basic.html",
  styleUrls: ["./carousel-basic.scss"]
})
export class NgbdCarouselBasic implements OnInit {
  images = [
    "https://i.imgur.com/wlmdNRZ.jpg",
    "https://i.imgur.com/WNlrLBr.jpg",
    "https://i.imgur.com/6MdlRxJ.jpg"
  ];

  constructor() {}

  ngOnInit() {}
}
