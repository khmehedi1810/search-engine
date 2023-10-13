import { useForm } from "@inertiajs/react";
import axios from "axios";
import { useEffect, useState } from "react";

export default function Welcome({ auth, laravelVersion, phpVersion }) {
    const { data, setData } = useForm({
        search: ''
    });
    const [searctResult, setSearchResult] = useState([])
    const [keywordCount, setKeywordCount] = useState([])

    const [copyData, setCopyData] = useState([]);
    const [tempData, setTempData] = useState([]);
    const [customStartDate, setCustomStartDate] = useState('');
    const [customEndDate, setCustomEndDate] = useState('');

    const handleSearch = () => {
        axios.post('/api/search-data', { ...data })
            .then((res) => {
                setSearchResult(res?.data?.data?.results)
                setCopyData(res?.data?.data?.results)
                console.log(res?.data?.data?.results)
                let myObject = res?.data?.count;
                let countAbleKey = Object.entries(myObject).map(i => ({ key: i[0], value: i[1] }))
                setKeywordCount(countAbleKey)
            })
            .catch((err) => {
                setSearchResult([])
            })
    }

    const handleYesterday = (e) => {
        if (e == true) {
            const today = new Date();
            const yesterday = new Date(today);
            yesterday.setDate(yesterday.getDate() - 1);
            filterData(yesterday, today);
        } else {
            setCopyData(tempData)
        }
    };

    const handleLast7Days = (e) => {
        if (e == true) {
            const today = new Date();
            const yesterday = new Date(today);
            yesterday.setDate(yesterday.getDate() - 7);
            filterData(yesterday, today);
        } else {
            setCopyData(tempData)
        }
    };

    const handleLast30Days = (e) => {
        if (e == true) {
            const today = new Date();
            const yesterday = new Date(today);
            yesterday.setDate(yesterday.getDate() - 30);
            filterData(yesterday, today);
        } else {
            setCopyData(tempData)
        }
    };

    const filterData = (startDate, endDate) => {
        const filteredData = copyData.filter(item => {
            const itemDate = new Date(item.created_at);

            return itemDate >= startDate && itemDate <= endDate;
        });
        setTempData(copyData)
        setCopyData(filteredData);
    };

    useEffect(() => {
        console.log(copyData)
    }, [copyData])

    return (
        <>
            <div class="flex flex-col items-center justify-center bg-white mt-5">
                <div>
                    <img class="h-[89px] w-[273px]" src="https://ppc.co/wp-content/uploads/2021/01/Google.png" alt="google Logo" />
                </div>
                <div class="md:w-[584px] mx-auto mt-7 flex w-[92%] items-center rounded-full border hover:shadow-md">
                    <div class="pl-5">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                        </svg>
                    </div>
                    <input
                        type="text"
                        class="w-full bg-transparent rounded-full py-[14px] pl-4 outline-none border-none focus:border-none"
                        onChange={(e) => setData('search', e.target.value)}
                    />
                    <div class="pr-5">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M19 11a7 7 0 01-7 7m0 0a7 7 0 01-7-7m7 7v4m0 0H8m4 0h4m-4-8a3 3 0 01-3-3V5a3 3 0 116 0v6a3 3 0 01-3 3z" />
                        </svg>
                    </div>
                </div>
                <div class="mt-3 flex space-x-12">
                    <button class="bg-[#f8f9fa] px-2 py-1" onClick={() => {
                        handleSearch();
                    }}>Google Search</button>
                </div>
                {searctResult.length !== 0 ? (
                    <div class='w-3/6 my-12'>
                        <div class="flex flex-col">
                            <div class="overflow-x-auto sm:-mx-6 lg:-mx-8">
                                <div class="inline-block w-full py-2 sm:px-6 lg:px-8">

                                    <div class="">

                                        <div class="flex items-center">
                                            <h1 class="text-2xl font-semibold mb-4 mr-3">Filtered Data: </h1>

                                            <div class="flex items-center mb-4">
                                                <div class='mr-2'>
                                                    <label for="chkYesterday" class="flex items-center">
                                                        <input
                                                            id="chkYesterday"
                                                            type="checkbox"
                                                            class="form-checkbox text-blue-500 h-5 w-5"
                                                            onChange={(e) => handleYesterday(e.target.checked)}
                                                        />
                                                        <span class="ml-2">Yesterday</span>
                                                    </label>
                                                </div>
                                                <div class='mr-2'>
                                                    <label for="chkLast7Days" class="flex items-center">
                                                        <input
                                                            id="chkLast7Days"
                                                            type="checkbox"
                                                            class="form-checkbox text-blue-500 h-5 w-5"
                                                            onChange={(e) => handleLast7Days(e.target.checked)} />
                                                        <span class="ml-2">Last 7 Days</span>
                                                    </label>
                                                </div>
                                                <div>
                                                    <label for="chkLast30Days" class="flex items-center">
                                                        <input
                                                            id="chkLast30Days"
                                                            type="checkbox"
                                                            class="form-checkbox text-blue-500 h-5 w-5"
                                                            onChange={(e) => handleLast30Days(e.target.checked)} />
                                                        <span class="ml-2">Last 30 Days</span>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div>
                                            <span class='text-lg font-semibold'>Keywords: </span>
                                            {
                                                keywordCount && keywordCount.map((item, i) => (
                                                    <button key={i}
                                                        class="bg-gray-100 text-gray-800 text-sm font-medium mr-2 px-2.5 py-0.5 rounded dark:bg-gray-700 dark:text-gray-300"
                                                    >
                                                        {item.key} <span class='bg-white text-black ml-2 px-1 rounded-full'>{item.value}</span>
                                                    </button>
                                                ))
                                            }
                                        </div>
                                    </div>

                                    <div class="overflow-hidden">
                                        <table class="w-full text-left text-sm font-light">
                                            <thead class="border-b font-medium dark:border-neutral-500">
                                                <tr>
                                                    <th scope="col" class="px-6 py-4">Name </th>
                                                    <th scope="col" class="px-6 py-4">Email</th>
                                                    <th scope="col" class="px-6 py-4">Created At</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                {copyData && copyData.map(item => (
                                                    <tr key={item.id} class="border-b dark:border-neutral-500">
                                                        <td class="whitespace-nowrap px-6 py-4">{item?.name}</td>
                                                        <td class="whitespace-nowrap px-6 py-4">{item?.email}</td>
                                                        <td class="whitespace-nowrap px-6 py-4">{item?.created_at}</td>
                                                    </tr>
                                                ))}
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                ) : (' ')}
            </div>


        </>
    );
}
