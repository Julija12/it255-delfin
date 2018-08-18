import { Component, OnInit, OnDestroy } from '@angular/core';
import Product from '../../models/product';
import ProizvodiService from '../../services/proizvodi.service';
import { Http } from '@angular/http';
import { ActivatedRoute, Router } from '@angular/router';
import Korpa from '../../models/korpa';
import 'rxjs/Rx';


@Component({
    selector: 'app-proizvodi',
    templateUrl: './proizvodi.component.html',
    styleUrls: ['./proizvodi.component.scss']
})
export default class ProizvodiComponent {

    id: number;
    products: Product[];
    isAuth: String;
    private sub: any;
    private router: Router;
    korpa: Korpa;



    constructor(private http: Http, router: Router, private proizvodiService: ProizvodiService, private route: ActivatedRoute) {
        var $: any;
        this.isAuth = localStorage.getItem('token');
        this.sub = this.route.params.subscribe(params => {
            this.id = +params['id'];

        });
        this.router = router;



    }
    ngOnInit() {
        this.loadProducts();
    }

    loadProducts() {
        this.proizvodiService.getProizvodi()
            .subscribe(
                data => this.products = data
            )
            ;


    }
    dodajUKorpu(id: number) {
        id = parseFloat(id.toString());

    }



    ngOnDestroy() {
        this.sub.unsubscribe();
    }


    public viewProduct(item: Number) {
        if (this.isAuth) {
            this.router.navigate(['/product', item]);
            localStorage.setItem('ID_PRODUCT', JSON.stringify(item).replace(/"/g, ""));
        } else {
            window.confirm("Molimo Vas ulogujte se! :)");
            this.router.navigate(['/login']);
        }

    }



}
