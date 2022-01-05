// # Proxy Compiler 21.11.3

import Foundation
import SAPOData

open class ESPMContainer<Provider: DataServiceProvider>: LegacyDataService<Provider> {
    override public init(provider: Provider) {
        super.init(provider: provider)
        self.provider.metadata = ESPMContainerMetadata.document
        ProxyInternal.setCsdlFetcher(provider: self.provider, fetcher: nil)
        ProxyInternal.setCsdlOptions(provider: self.provider, options: ESPMContainerMetadataParser.options)
    }

    open func fetchCustomer(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Customer {
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try CastRequired<Customer>.from(executeQuery(query.fromDefault(ESPMContainerMetadata.EntitySets.customers), headers: var_headers, options: var_options).requiredEntity())
    }

    open func fetchCustomer(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (Customer?, Error?) -> Void) {
        addBackgroundOperationForFunction {
            do {
                let result = try self.fetchCustomer(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchCustomerWithKey(customerID: String?, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Customer {
        let var_query = DataQuery.newIfNull(query: query)
        return try fetchCustomer(matching: var_query.withKey(Customer.key(customerID: customerID)), headers: headers, options: options)
    }

    open func fetchCustomerWithKey(customerID: String?, query: DataQuery?, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (Customer?, Error?) -> Void) {
        addBackgroundOperationForFunction {
            do {
                let result = try self.fetchCustomerWithKey(customerID: customerID, query: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchCustomers(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> [Customer] {
        let var_query = DataQuery.newIfNull(query: query)
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try Customer.array(from: executeQuery(var_query.fromDefault(ESPMContainerMetadata.EntitySets.customers), headers: var_headers, options: var_options).entityList())
    }

    open func fetchCustomers(matching query: DataQuery = DataQuery(), headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping ([Customer]?, Error?) -> Void) {
        addBackgroundOperationForFunction {
            do {
                let result = try self.fetchCustomers(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchProduct(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Product {
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try CastRequired<Product>.from(executeQuery(query.fromDefault(ESPMContainerMetadata.EntitySets.products), headers: var_headers, options: var_options).requiredEntity())
    }

    open func fetchProduct(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (Product?, Error?) -> Void) {
        addBackgroundOperationForFunction {
            do {
                let result = try self.fetchProduct(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchProductCategories(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> [ProductCategory] {
        let var_query = DataQuery.newIfNull(query: query)
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try ProductCategory.array(from: executeQuery(var_query.fromDefault(ESPMContainerMetadata.EntitySets.productCategories), headers: var_headers, options: var_options).entityList())
    }

    open func fetchProductCategories(matching query: DataQuery = DataQuery(), headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping ([ProductCategory]?, Error?) -> Void) {
        addBackgroundOperationForFunction {
            do {
                let result = try self.fetchProductCategories(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchProductCategory(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> ProductCategory {
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try CastRequired<ProductCategory>.from(executeQuery(query.fromDefault(ESPMContainerMetadata.EntitySets.productCategories), headers: var_headers, options: var_options).requiredEntity())
    }

    open func fetchProductCategory(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (ProductCategory?, Error?) -> Void) {
        addBackgroundOperationForFunction {
            do {
                let result = try self.fetchProductCategory(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchProductCategoryWithKey(category: String?, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> ProductCategory {
        let var_query = DataQuery.newIfNull(query: query)
        return try fetchProductCategory(matching: var_query.withKey(ProductCategory.key(category: category)), headers: headers, options: options)
    }

    open func fetchProductCategoryWithKey(category: String?, query: DataQuery?, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (ProductCategory?, Error?) -> Void) {
        addBackgroundOperationForFunction {
            do {
                let result = try self.fetchProductCategoryWithKey(category: category, query: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchProductText(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> ProductText {
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try CastRequired<ProductText>.from(executeQuery(query.fromDefault(ESPMContainerMetadata.EntitySets.productTexts), headers: var_headers, options: var_options).requiredEntity())
    }

    open func fetchProductText(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (ProductText?, Error?) -> Void) {
        addBackgroundOperationForFunction {
            do {
                let result = try self.fetchProductText(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchProductTextWithKey(id: Int64?, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> ProductText {
        let var_query = DataQuery.newIfNull(query: query)
        return try fetchProductText(matching: var_query.withKey(ProductText.key(id: id)), headers: headers, options: options)
    }

    open func fetchProductTextWithKey(id: Int64?, query: DataQuery?, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (ProductText?, Error?) -> Void) {
        addBackgroundOperationForFunction {
            do {
                let result = try self.fetchProductTextWithKey(id: id, query: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchProductTexts(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> [ProductText] {
        let var_query = DataQuery.newIfNull(query: query)
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try ProductText.array(from: executeQuery(var_query.fromDefault(ESPMContainerMetadata.EntitySets.productTexts), headers: var_headers, options: var_options).entityList())
    }

    open func fetchProductTexts(matching query: DataQuery = DataQuery(), headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping ([ProductText]?, Error?) -> Void) {
        addBackgroundOperationForFunction {
            do {
                let result = try self.fetchProductTexts(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchProductWithKey(productID: String?, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Product {
        let var_query = DataQuery.newIfNull(query: query)
        return try fetchProduct(matching: var_query.withKey(Product.key(productID: productID)), headers: headers, options: options)
    }

    open func fetchProductWithKey(productID: String?, query: DataQuery?, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (Product?, Error?) -> Void) {
        addBackgroundOperationForFunction {
            do {
                let result = try self.fetchProductWithKey(productID: productID, query: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchProducts(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> [Product] {
        let var_query = DataQuery.newIfNull(query: query)
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try Product.array(from: executeQuery(var_query.fromDefault(ESPMContainerMetadata.EntitySets.products), headers: var_headers, options: var_options).entityList())
    }

    open func fetchProducts(matching query: DataQuery = DataQuery(), headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping ([Product]?, Error?) -> Void) {
        addBackgroundOperationForFunction {
            do {
                let result = try self.fetchProducts(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchPurchaseOrderHeader(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> PurchaseOrderHeader {
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try CastRequired<PurchaseOrderHeader>.from(executeQuery(query.fromDefault(ESPMContainerMetadata.EntitySets.purchaseOrderHeaders), headers: var_headers, options: var_options).requiredEntity())
    }

    open func fetchPurchaseOrderHeader(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (PurchaseOrderHeader?, Error?) -> Void) {
        addBackgroundOperationForFunction {
            do {
                let result = try self.fetchPurchaseOrderHeader(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchPurchaseOrderHeaderWithKey(purchaseOrderID: String?, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> PurchaseOrderHeader {
        let var_query = DataQuery.newIfNull(query: query)
        return try fetchPurchaseOrderHeader(matching: var_query.withKey(PurchaseOrderHeader.key(purchaseOrderID: purchaseOrderID)), headers: headers, options: options)
    }

    open func fetchPurchaseOrderHeaderWithKey(purchaseOrderID: String?, query: DataQuery?, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (PurchaseOrderHeader?, Error?) -> Void) {
        addBackgroundOperationForFunction {
            do {
                let result = try self.fetchPurchaseOrderHeaderWithKey(purchaseOrderID: purchaseOrderID, query: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchPurchaseOrderHeaders(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> [PurchaseOrderHeader] {
        let var_query = DataQuery.newIfNull(query: query)
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try PurchaseOrderHeader.array(from: executeQuery(var_query.fromDefault(ESPMContainerMetadata.EntitySets.purchaseOrderHeaders), headers: var_headers, options: var_options).entityList())
    }

    open func fetchPurchaseOrderHeaders(matching query: DataQuery = DataQuery(), headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping ([PurchaseOrderHeader]?, Error?) -> Void) {
        addBackgroundOperationForFunction {
            do {
                let result = try self.fetchPurchaseOrderHeaders(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchPurchaseOrderItem(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> PurchaseOrderItem {
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try CastRequired<PurchaseOrderItem>.from(executeQuery(query.fromDefault(ESPMContainerMetadata.EntitySets.purchaseOrderItems), headers: var_headers, options: var_options).requiredEntity())
    }

    open func fetchPurchaseOrderItem(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (PurchaseOrderItem?, Error?) -> Void) {
        addBackgroundOperationForFunction {
            do {
                let result = try self.fetchPurchaseOrderItem(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchPurchaseOrderItemWithKey(itemNumber: Int?, purchaseOrderID: String?, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> PurchaseOrderItem {
        let var_query = DataQuery.newIfNull(query: query)
        return try fetchPurchaseOrderItem(matching: var_query.withKey(PurchaseOrderItem.key(itemNumber: itemNumber, purchaseOrderID: purchaseOrderID)), headers: headers, options: options)
    }

    open func fetchPurchaseOrderItemWithKey(itemNumber: Int?, purchaseOrderID: String?, query: DataQuery?, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (PurchaseOrderItem?, Error?) -> Void) {
        addBackgroundOperationForFunction {
            do {
                let result = try self.fetchPurchaseOrderItemWithKey(itemNumber: itemNumber, purchaseOrderID: purchaseOrderID, query: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchPurchaseOrderItems(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> [PurchaseOrderItem] {
        let var_query = DataQuery.newIfNull(query: query)
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try PurchaseOrderItem.array(from: executeQuery(var_query.fromDefault(ESPMContainerMetadata.EntitySets.purchaseOrderItems), headers: var_headers, options: var_options).entityList())
    }

    open func fetchPurchaseOrderItems(matching query: DataQuery = DataQuery(), headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping ([PurchaseOrderItem]?, Error?) -> Void) {
        addBackgroundOperationForFunction {
            do {
                let result = try self.fetchPurchaseOrderItems(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchSalesOrderHeader(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> SalesOrderHeader {
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try CastRequired<SalesOrderHeader>.from(executeQuery(query.fromDefault(ESPMContainerMetadata.EntitySets.salesOrderHeaders), headers: var_headers, options: var_options).requiredEntity())
    }

    open func fetchSalesOrderHeader(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (SalesOrderHeader?, Error?) -> Void) {
        addBackgroundOperationForFunction {
            do {
                let result = try self.fetchSalesOrderHeader(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchSalesOrderHeaderWithKey(salesOrderID: String?, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> SalesOrderHeader {
        let var_query = DataQuery.newIfNull(query: query)
        return try fetchSalesOrderHeader(matching: var_query.withKey(SalesOrderHeader.key(salesOrderID: salesOrderID)), headers: headers, options: options)
    }

    open func fetchSalesOrderHeaderWithKey(salesOrderID: String?, query: DataQuery?, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (SalesOrderHeader?, Error?) -> Void) {
        addBackgroundOperationForFunction {
            do {
                let result = try self.fetchSalesOrderHeaderWithKey(salesOrderID: salesOrderID, query: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchSalesOrderHeaders(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> [SalesOrderHeader] {
        let var_query = DataQuery.newIfNull(query: query)
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try SalesOrderHeader.array(from: executeQuery(var_query.fromDefault(ESPMContainerMetadata.EntitySets.salesOrderHeaders), headers: var_headers, options: var_options).entityList())
    }

    open func fetchSalesOrderHeaders(matching query: DataQuery = DataQuery(), headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping ([SalesOrderHeader]?, Error?) -> Void) {
        addBackgroundOperationForFunction {
            do {
                let result = try self.fetchSalesOrderHeaders(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchSalesOrderItem(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> SalesOrderItem {
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try CastRequired<SalesOrderItem>.from(executeQuery(query.fromDefault(ESPMContainerMetadata.EntitySets.salesOrderItems), headers: var_headers, options: var_options).requiredEntity())
    }

    open func fetchSalesOrderItem(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (SalesOrderItem?, Error?) -> Void) {
        addBackgroundOperationForFunction {
            do {
                let result = try self.fetchSalesOrderItem(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchSalesOrderItemWithKey(itemNumber: Int?, salesOrderID: String?, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> SalesOrderItem {
        let var_query = DataQuery.newIfNull(query: query)
        return try fetchSalesOrderItem(matching: var_query.withKey(SalesOrderItem.key(itemNumber: itemNumber, salesOrderID: salesOrderID)), headers: headers, options: options)
    }

    open func fetchSalesOrderItemWithKey(itemNumber: Int?, salesOrderID: String?, query: DataQuery?, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (SalesOrderItem?, Error?) -> Void) {
        addBackgroundOperationForFunction {
            do {
                let result = try self.fetchSalesOrderItemWithKey(itemNumber: itemNumber, salesOrderID: salesOrderID, query: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchSalesOrderItems(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> [SalesOrderItem] {
        let var_query = DataQuery.newIfNull(query: query)
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try SalesOrderItem.array(from: executeQuery(var_query.fromDefault(ESPMContainerMetadata.EntitySets.salesOrderItems), headers: var_headers, options: var_options).entityList())
    }

    open func fetchSalesOrderItems(matching query: DataQuery = DataQuery(), headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping ([SalesOrderItem]?, Error?) -> Void) {
        addBackgroundOperationForFunction {
            do {
                let result = try self.fetchSalesOrderItems(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchStock(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> [Stock] {
        let var_query = DataQuery.newIfNull(query: query)
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try Stock.array(from: executeQuery(var_query.fromDefault(ESPMContainerMetadata.EntitySets.stock), headers: var_headers, options: var_options).entityList())
    }

    open func fetchStock(matching query: DataQuery = DataQuery(), headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping ([Stock]?, Error?) -> Void) {
        addBackgroundOperationForFunction {
            do {
                let result = try self.fetchStock(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchStock1(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Stock {
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try CastRequired<Stock>.from(executeQuery(query.fromDefault(ESPMContainerMetadata.EntitySets.stock), headers: var_headers, options: var_options).requiredEntity())
    }

    open func fetchStock1(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (Stock?, Error?) -> Void) {
        addBackgroundOperationForFunction {
            do {
                let result = try self.fetchStock1(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchStock1WithKey(productID: String?, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Stock {
        let var_query = DataQuery.newIfNull(query: query)
        return try fetchStock1(matching: var_query.withKey(Stock.key(productID: productID)), headers: headers, options: options)
    }

    open func fetchStock1WithKey(productID: String?, query: DataQuery?, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (Stock?, Error?) -> Void) {
        addBackgroundOperationForFunction {
            do {
                let result = try self.fetchStock1WithKey(productID: productID, query: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchSupplier(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Supplier {
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try CastRequired<Supplier>.from(executeQuery(query.fromDefault(ESPMContainerMetadata.EntitySets.suppliers), headers: var_headers, options: var_options).requiredEntity())
    }

    open func fetchSupplier(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (Supplier?, Error?) -> Void) {
        addBackgroundOperationForFunction {
            do {
                let result = try self.fetchSupplier(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchSupplierWithKey(supplierID: String?, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Supplier {
        let var_query = DataQuery.newIfNull(query: query)
        return try fetchSupplier(matching: var_query.withKey(Supplier.key(supplierID: supplierID)), headers: headers, options: options)
    }

    open func fetchSupplierWithKey(supplierID: String?, query: DataQuery?, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (Supplier?, Error?) -> Void) {
        addBackgroundOperationForFunction {
            do {
                let result = try self.fetchSupplierWithKey(supplierID: supplierID, query: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchSuppliers(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> [Supplier] {
        let var_query = DataQuery.newIfNull(query: query)
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try Supplier.array(from: executeQuery(var_query.fromDefault(ESPMContainerMetadata.EntitySets.suppliers), headers: var_headers, options: var_options).entityList())
    }

    open func fetchSuppliers(matching query: DataQuery = DataQuery(), headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping ([Supplier]?, Error?) -> Void) {
        addBackgroundOperationForFunction {
            do {
                let result = try self.fetchSuppliers(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func generateSamplePurchaseOrders(query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Bool {
        let var_query = DataQuery.newIfNull(query: query)
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try BooleanValue.unwrap(executeQuery(var_query.invoke(ESPMContainerMetadata.ActionImports.generateSamplePurchaseOrders, ParameterList.empty), headers: var_headers, options: var_options).result)
    }

    open func generateSamplePurchaseOrders(query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (Bool?, Error?) -> Void) {
        addBackgroundOperationForFunction {
            do {
                let result = try self.generateSamplePurchaseOrders(query: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func generateSampleSalesOrders(query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Bool {
        let var_query = DataQuery.newIfNull(query: query)
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try BooleanValue.unwrap(executeQuery(var_query.invoke(ESPMContainerMetadata.ActionImports.generateSampleSalesOrders, ParameterList.empty), headers: var_headers, options: var_options).result)
    }

    open func generateSampleSalesOrders(query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (Bool?, Error?) -> Void) {
        addBackgroundOperationForFunction {
            do {
                let result = try self.generateSampleSalesOrders(query: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    override open var metadataLock: MetadataLock {
        return ESPMContainerMetadata.lock
    }

    override open func refreshMetadata() throws {
        objc_sync_enter(self)
        defer { objc_sync_exit(self) }
        do {
            try ProxyInternal.refreshMetadataWithLock(service: self, fetcher: nil, options: ESPMContainerMetadataParser.options, mergeAction: { ESPMContainerMetadataChanges.merge(metadata: self.metadata) })
        }
    }

    open func resetSampleData(query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Bool {
        let var_query = DataQuery.newIfNull(query: query)
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try BooleanValue.unwrap(executeQuery(var_query.invoke(ESPMContainerMetadata.ActionImports.resetSampleData, ParameterList.empty), headers: var_headers, options: var_options).result)
    }

    open func resetSampleData(query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (Bool?, Error?) -> Void) {
        addBackgroundOperationForFunction {
            do {
                let result = try self.resetSampleData(query: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func updateSalesOrderStatus(id: String, newStatus: String, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Bool {
        let var_query = DataQuery.newIfNull(query: query)
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try BooleanValue.unwrap(executeQuery(var_query.invoke(ESPMContainerMetadata.ActionImports.updateSalesOrderStatus, ParameterList(capacity: 2 as Int).with(name: "id", value: StringValue.of(id)).with(name: "newStatus", value: StringValue.of(newStatus))), headers: var_headers, options: var_options).result)
    }

    open func updateSalesOrderStatus(id: String, newStatus: String, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (Bool?, Error?) -> Void) {
        addBackgroundOperationForFunction {
            do {
                let result = try self.updateSalesOrderStatus(id: id, newStatus: newStatus, query: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }
}
