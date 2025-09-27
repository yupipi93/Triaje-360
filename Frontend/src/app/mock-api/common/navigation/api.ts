import { Injectable } from '@angular/core';
import { FuseNavigationItem } from '@fuse/components/navigation';
import { FuseMockApiService } from '@fuse/lib/mock-api';
import {
    profNavigation,
    adminNavigation,
    aluNavigation,
    horizontalNavigation,
} from 'app/mock-api/common/navigation/data';
import { cloneDeep } from 'lodash-es';

@Injectable({ providedIn: 'root' })
export class NavigationMockApi {
    private readonly _profNavigation: FuseNavigationItem[] =
        profNavigation;
    private readonly _adminNavigation: FuseNavigationItem[] =
        adminNavigation;
    private readonly _aluNavigation: FuseNavigationItem[] =
        aluNavigation;
    private readonly _horizontalNavigation: FuseNavigationItem[] =
        horizontalNavigation;

    /**
     * Constructor
     */
    constructor(private _fuseMockApiService: FuseMockApiService) {
        // Register Mock API handlers
        this.registerHandlers();
    }

    // -----------------------------------------------------------------------------------------------------
    // @ Public methods
    // -----------------------------------------------------------------------------------------------------

    /**
     * Register Mock API handlers
     */
    registerHandlers(): void {
        // -----------------------------------------------------------------------------------------------------
        // @ Navigation - GET
        // -----------------------------------------------------------------------------------------------------
        this._fuseMockApiService.onGet('api/common/navigation').reply(() => {
            // Fill compact navigation children using the default navigation
            this._profNavigation.forEach((profNavItem) => {
                this._adminNavigation.forEach((adminNavItem) => {
                    if (adminNavItem.id === profNavItem.id) {
                        profNavItem.children = cloneDeep(
                            adminNavItem.children
                        );
                    }
                });
            });

            // Fill futuristic navigation children using the default navigation
            this._aluNavigation.forEach((aluNavItem) => {
                this._adminNavigation.forEach((adminNavItem) => {
                    if (adminNavItem.id === aluNavItem.id) {
                        aluNavItem.children = cloneDeep(
                            adminNavItem.children
                        );
                    }
                });
            });

            // Fill horizontal navigation children using the default navigation
            this._horizontalNavigation.forEach((horizontalNavItem) => {
                this._adminNavigation.forEach((adminNavItem) => {
                    if (adminNavItem.id === horizontalNavItem.id) {
                        horizontalNavItem.children = cloneDeep(
                            adminNavItem.children
                        );
                    }
                });
            });

            // Return the response
            return [
                200,
                {
                    prof: cloneDeep(this._profNavigation),
                    admin: cloneDeep(this._adminNavigation),
                    alu: cloneDeep(this._aluNavigation),
                    horizontal: cloneDeep(this._horizontalNavigation),
                },
            ];
        });
    }
}
