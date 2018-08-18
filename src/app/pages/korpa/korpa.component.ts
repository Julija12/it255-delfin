import { Component, OnInit } from '@angular/core';
import User from '../../models/user';
import Product from '../../models/product';
import { Http } from '@angular/http';
import { Router } from '@angular/router';
import { UserService } from '../../services/user.service';
import { SharedService } from '../../services/shared.service';
import {TimerObservable} from "rxjs/observable/TimerObservable";
import { KorpaService } from '../../services/korpa.service';

@Component({
  selector: 'app-korpa',
  templateUrl: './korpa.component.html',
  styleUrls: ['./korpa.component.scss']
})
export class KorpaComponent implements OnInit {

  user : User;
  data: Object[];
  data2: String;
  prKorpa: Product[];
  idKorpe: number;
  totalPrice: number = 0;
  isDone : boolean = false;

  constructor(private http: Http, private router: Router, private cartService: KorpaService, private userService: UserService, private sharedService :SharedService) {
        if (localStorage.getItem('token') == null) {
            this.router.navigate(['/']);
        }

    }

    ngOnInit() {
      this.loadCart();
      this.loadUser();
  }

  loadUser() {
    this.userService.getUser()
        .subscribe(data => {
            this.user = data
        });


}

loadCart(){
  this.cartService.getCart()
      .subscribe(data => {
          this.prKorpa = data;
          console.log(this.prKorpa);
      });



}
remove(product_id: number) {
  this.cartService.removeFromCart(product_id);
  setTimeout(this.loadCart(), 3000);
  // bas za ovaj id product_id izbrisi mi iz ovog niza this.prKorpa
}

checkout() {
  this.isDone = true;
  this.cartService.checkout();
  let timer = TimerObservable.create(1000, 500);
  timer.subscribe(t => {
      location.reload();
      this.router.navigate(['/korpa']);
  });
}

update(product_id: number, quantity: number) {
  this.cartService.updateInCart(product_id, quantity);
}

postarina(){
  let postarina = 0;
   postarina =  this.getTotal() * 0.1;

  return postarina;
}

getTotal() {

  let total = 0;
  for (var i = 0; i < this.prKorpa.length; i++) {
      if (this.prKorpa[i].cena) {
          total += this.prKorpa[i].cena * this.prKorpa[i].kolicina;
          this.totalPrice = total;
          this.idKorpe = this.prKorpa[i].idKorpe;
      }
  }

  return total;
}

getUkupno(){


  return this.getTotal() + this.postarina();

}

}
